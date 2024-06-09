package com.fitness.pass.pass_batch.repository.packaze;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PackageRepository extends JpaRepository<PackageEntity,Integer> {

}
