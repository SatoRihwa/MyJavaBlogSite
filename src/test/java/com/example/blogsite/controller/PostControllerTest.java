package com.example.blogsite.controller;

import com.example.blogsite.model.Post;
import com.example.blogsite.service.PostService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class PostControllerTest {

    @Mock
    private PostService postService;

    @Mock
    private Model model;

    @Mock
    private BindingResult bindingResult;

    @Mock
    private RedirectAttributes redirectAttributes;

    @InjectMocks
    private PostController postController;

    private MockMvc mockMvc;
    private Post testPost;
    private List<Post> testPosts;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(postController).build();

        testPost = new Post();
        testPost.setId(1L);
        testPost.setTitle("Test Title");
        testPost.setContent("Test Content");
        testPost.setCreatedAt(LocalDateTime.now());
        testPost.setUpdatedAt(LocalDateTime.now());

        testPosts = new ArrayList<>();
        testPosts.add(testPost);
    }

    @Test
    public void testIndex() {
        // Setup
        when(postService.getAllPosts()).thenReturn(testPosts);

        // Execute
        String viewName = postController.index(model);

        // Verify
        assertEquals("index", viewName);
        verify(model).addAttribute("posts", testPosts);
        verify(postService).getAllPosts();
    }

    @Test
    public void testIndexWithMockMvc() throws Exception {
        // Setup
        when(postService.getAllPosts()).thenReturn(testPosts);

        // Execute & Verify
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("index"))
                .andExpect(model().attributeExists("posts"));

        verify(postService).getAllPosts();
    }

    @Test
    public void testNewPostForm() {
        // Execute
        String viewName = postController.newPostForm(model);

        // Verify
        assertEquals("post-form", viewName);
        verify(model).addAttribute(eq("post"), any(Post.class));
    }

    @Test
    public void testNewPostFormWithMockMvc() throws Exception {
        // Execute & Verify
        mockMvc.perform(get("/posts/new"))
                .andExpect(status().isOk())
                .andExpect(view().name("post-form"))
                .andExpect(model().attributeExists("post"));
    }

    @Test
    public void testCreatePostSuccess() {
        // Setup
        when(bindingResult.hasErrors()).thenReturn(false);
        when(postService.savePost(any(Post.class))).thenReturn(testPost);

        // Execute
        String viewName = postController.createPost(testPost, bindingResult, redirectAttributes);

        // Verify
        assertEquals("redirect:/", viewName);
        verify(postService).savePost(testPost);
        verify(redirectAttributes).addFlashAttribute("successMessage", "投稿が作成されました！");
    }

    @Test
    public void testCreatePostWithValidationErrors() {
        // Setup
        when(bindingResult.hasErrors()).thenReturn(true);

        // Execute
        String viewName = postController.createPost(testPost, bindingResult, redirectAttributes);

        // Verify
        assertEquals("post-form", viewName);
        verify(postService, never()).savePost(any(Post.class));
    }

    @Test
    public void testShowPostExists() {
        // Setup
        when(postService.getPostById(1L)).thenReturn(Optional.of(testPost));

        // Execute
        String viewName = postController.showPost(1L, model);

        // Verify
        assertEquals("post-detail", viewName);
        verify(postService).getPostById(1L);
        verify(model).addAttribute("post", testPost);
    }

    @Test
    public void testShowPostNotFound() {
        // Setup
        when(postService.getPostById(1L)).thenReturn(Optional.empty());

        // Execute
        String viewName = postController.showPost(1L, model);

        // Verify
        assertEquals("redirect:/", viewName);
        verify(postService).getPostById(1L);
        verify(model, never()).addAttribute(eq("post"), any());
    }

    @Test
    public void testShowPostWithMockMvc() throws Exception {
        // Setup
        when(postService.getPostById(1L)).thenReturn(Optional.of(testPost));

        // Execute & Verify
        mockMvc.perform(get("/posts/1"))
                .andExpect(status().isOk())
                .andExpect(view().name("post-detail"))
                .andExpect(model().attributeExists("post"));

        verify(postService).getPostById(1L);
    }

    @Test
    public void testEditPostFormExists() {
        // Setup
        when(postService.getPostById(1L)).thenReturn(Optional.of(testPost));

        // Execute
        String viewName = postController.editPostForm(1L, model);

        // Verify
        assertEquals("post-form", viewName);
        verify(postService).getPostById(1L);
        verify(model).addAttribute("post", testPost);
    }

    @Test
    public void testEditPostFormNotFound() {
        // Setup
        when(postService.getPostById(1L)).thenReturn(Optional.empty());

        // Execute
        String viewName = postController.editPostForm(1L, model);

        // Verify
        assertEquals("redirect:/", viewName);
        verify(postService).getPostById(1L);
        verify(model, never()).addAttribute(eq("post"), any());
    }

    @Test
    public void testUpdatePostSuccess() {
        // Setup
        when(bindingResult.hasErrors()).thenReturn(false);
        when(postService.savePost(any(Post.class))).thenReturn(testPost);

        // Execute
        String viewName = postController.updatePost(1L, testPost, bindingResult, redirectAttributes);

        // Verify
        assertEquals("redirect:/posts/1", viewName);
        verify(postService).savePost(testPost);
        verify(redirectAttributes).addFlashAttribute("successMessage", "投稿が更新されました！");
        assertEquals(1L, testPost.getId());
    }

    @Test
    public void testUpdatePostWithValidationErrors() {
        // Setup
        when(bindingResult.hasErrors()).thenReturn(true);

        // Execute
        String viewName = postController.updatePost(1L, testPost, bindingResult, redirectAttributes);

        // Verify
        assertEquals("post-form", viewName);
        verify(postService, never()).savePost(any(Post.class));
    }

    @Test
    public void testDeletePost() {
        // Execute
        String viewName = postController.deletePost(1L, redirectAttributes);

        // Verify
        assertEquals("redirect:/", viewName);
        verify(postService).deletePost(1L);
        verify(redirectAttributes).addFlashAttribute("successMessage", "投稿が削除されました！");
    }

    @Test
    public void testDeletePostWithMockMvc() throws Exception {
        // Execute & Verify
        mockMvc.perform(post("/posts/1/delete"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/"));

        verify(postService).deletePost(1L);
    }
}