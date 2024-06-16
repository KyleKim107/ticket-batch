package com.fitness.pass.pass_batch.repository.packaze;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.ActiveProfiles;

import java.time.LocalDateTime;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@Slf4j
@SpringBootTest
@ActiveProfiles("test")
public class PackageRepositoryTest {
    @Autowired
    private PackageRepository packageRepository;
    private PackageEntity packageEntity;

    @BeforeEach
    public void setUp() {
        packageEntity = new PackageEntity();
    }

    @Test
    public void test_save() {
        // given
        PackageEntity packageEntity = new PackageEntity();
        packageEntity.setPackageName("바디 첼린지 PT 12주");
        packageEntity.setPeriod(84);

        // when
        packageRepository.save(packageEntity);

        // then
        assertNotNull(packageEntity.getPackageSeq());
    }

    @Test
    public void test_findByCreatedAtAfter(){
        //given
        LocalDateTime dateTime = LocalDateTime.now().minusDays(1);

        PackageEntity packageEntity = new PackageEntity();
        packageEntity.setPackageName("학생전용 3개월");
        packageEntity.setPeriod(90);
        packageRepository.save(packageEntity);

        PackageEntity packageEntity1 = new PackageEntity();
        packageEntity1.setPackageName("학생전용 6개월");
        packageEntity1.setPeriod(180);
        packageRepository.save(packageEntity1);

        // when
        final List<PackageEntity> packageEntities = packageRepository.findByCreatedAtAfter(dateTime, PageRequest.of(0, 1, Sort.by("packageSeq").descending()));

        //then
        assertEquals(1, packageEntities.size());
        assertEquals(packageEntity1.getPackageSeq(), packageEntities.get(0).getPackageSeq());

    }

    @Test
    public void test_updateCountAndPeriod(){
        //given
        PackageEntity packageEntity = new PackageEntity();
        packageEntity.setPackageName("바디프로필 3개월");
        packageEntity.setPeriod(90);
        packageRepository.save(packageEntity);

        //when
        int updatedCount = packageRepository.updateCountAndPeriod( packageEntity.getPackageSeq(),10, 180);

        //then
        final PackageEntity findPackage = packageRepository.findById(packageEntity.getPackageSeq()).get();
        assertEquals(1, updatedCount);
        assertEquals(10, findPackage.getCount());
        assertEquals(180, findPackage.getPeriod());
    }

    @Test
    public void test_delete(){
        //given
        PackageEntity packageEntity = new PackageEntity();
        packageEntity.setPackageName("제거할 이용권");
        packageEntity.setPeriod(1);
        PackageEntity newPackageEntity = packageRepository.save(packageEntity);

        //when
        packageRepository.deleteById(newPackageEntity.getPackageSeq());

        //then
        assertFalse(packageRepository.findById(packageEntity.getPackageSeq()).isPresent());
    }


}
