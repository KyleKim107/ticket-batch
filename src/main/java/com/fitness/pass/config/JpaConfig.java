package com.fitness.pass.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing // 날짜 자동맵핑 설정.
@Configuration
public class JpaConfig {
}
