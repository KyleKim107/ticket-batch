package com.fitness.pass.pass_batch.repository;

import com.fitness.pass.pass_batch.repository.packaze.PackageEntity;
import com.fitness.pass.pass_batch.repository.packaze.PackageRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@Slf4j
@SpringBootTest
@ActiveProfiles("test")
public class PackageRepositoryTest {
    @Autowired
    private PackageRepository packageRepository;

    @Test
    public void test_save() {
        // given
        PackageEntity packageEntity = new PackageEntity();
        packageEntity.setPackageName("바디 첼린지 PT 12주");
        packageEntity.setPeriod(84);

        // when
        packageRepository.save(packageEntity);

        // then
        Assertions.assertNotNull(packageEntity.getPackageSeq());
    }


}
