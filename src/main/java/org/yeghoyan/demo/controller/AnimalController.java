package org.yeghoyan.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/animals")
public class AnimalController {

    @Autowired
    AnimalRepository animalRepository;

    /**
     * Get all animal notes
     */
    @GetMapping
    public List getAll() {

        return animalRepository.findAll();
    }

    /**
     * Create animal note
     */
    @PostMapping
    public Animal create(@Valid @RequestBody Animal animal) {
        return animalRepository.save(animal);
    }

    /**
     * Get animal by id
     */
    @GetMapping("/{id}")
    public Animal getById(@PathVariable(value = "id") Integer id) throws AnimalNotFoundException {
        return animalRepository.findById(id)
                .orElseThrow(() -> new AnimalNotFoundException(id));
    }

    /**
     * Update animal note
     */
    @PutMapping("/{id}")
    public Animal update(@PathVariable(value = "id") Integer id,
                             @Valid @RequestBody Animal animalDetails) throws AnimalNotFoundException {

        Animal animal = animalRepository.findById(id)
                .orElseThrow(() -> new AnimalNotFoundException(id));

        animal.setName(animalDetails.getName());
        animal.setKind(animalDetails.getKind());
        animal.setPrice(animalDetails.getPrice());

        Animal updatedAnimal = animalRepository.save(animal);
        return updatedAnimal;
    }

    /**
     * Delete animal note
     */
    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable(value = "id") Integer id) throws AnimalNotFoundException {
        Animal animal = animalRepository.findById(id)
                .orElseThrow(() -> new AnimalNotFoundException(id));
        animalRepository.delete(animal);
        return ResponseEntity.ok().build();
    }
}
