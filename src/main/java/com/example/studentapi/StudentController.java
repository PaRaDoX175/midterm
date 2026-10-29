package com.example.studentapi;

import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/students")
public class StudentController {
    private final Map<Long, Student> students = new HashMap<>();
    private long nextId = 1;

    @PostMapping
    public Student create(@RequestBody Student student) {
        student.setId(nextId++);
        students.put(student.getId(), student);
        return student;
    }

    @GetMapping
    public Collection<Student> getAll() {
        return students.values();
    }
}