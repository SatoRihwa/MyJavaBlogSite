package com.example.blogsite.controller;

import com.example.blogsite.model.Post;
import com.example.blogsite.service.PostService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
public class PostController {

    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("posts", postService.getAllPosts());
        return "index";
    }

    @GetMapping("/posts/new")
    public String newPostForm(Model model) {
        model.addAttribute("post", new Post());
        return "post-form";
    }

    @PostMapping("/posts")
    public String createPost(@Valid @ModelAttribute Post post, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "post-form";
        }
        postService.savePost(post);
        redirectAttributes.addFlashAttribute("successMessage", "投稿が作成されました！");
        return "redirect:/";
    }

    @GetMapping("/posts/{id}")
    public String showPost(@PathVariable Long id, Model model) {
        Optional<Post> post = postService.getPostById(id);
        if (post.isPresent()) {
            model.addAttribute("post", post.get());
            return "post-detail";
        } else {
            return "redirect:/";
        }
    }

    @GetMapping("/posts/{id}/edit")
    public String editPostForm(@PathVariable Long id, Model model) {
        Optional<Post> post = postService.getPostById(id);
        if (post.isPresent()) {
            model.addAttribute("post", post.get());
            return "post-form";
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/posts/{id}")
    public String updatePost(@PathVariable Long id, @Valid @ModelAttribute Post post, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "post-form";
        }
        post.setId(id);
        postService.savePost(post);
        redirectAttributes.addFlashAttribute("successMessage", "投稿が更新されました！");
        return "redirect:/posts/" + id;
    }

    @PostMapping("/posts/{id}/delete")
    public String deletePost(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        postService.deletePost(id);
        redirectAttributes.addFlashAttribute("successMessage", "投稿が削除されました！");
        return "redirect:/";
    }
}