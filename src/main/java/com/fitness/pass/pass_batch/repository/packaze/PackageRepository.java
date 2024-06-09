package com.fitness.pass.pass_batch.repository.packaze;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface PackageRepository extends JpaRepository<PackageEntity,Integer> {
    List<PackageEntity> findByCreatedAtAfter(LocalDateTime dateTime, Pageable pageable);
    @Transactional
    @Modifying // update, delete 쿼리를 실행하기 위한 어노테이션
    @Query("update PackageEntity p " +
            "set p.count = :count," +
            "    p.period = :period " +
            "where p.packageSeq = :packageSeq")
    int updateCountAndPeriod(@Param("packageSeq") Integer packageSeq,@Param("count") Integer count,@Param("period") Integer period);
}
