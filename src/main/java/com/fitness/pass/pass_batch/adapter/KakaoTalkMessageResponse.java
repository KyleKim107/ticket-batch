package com.fitness.pass.pass_batch.adapter;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;
@Getter
@Setter
@ToString
public class KakaoTalkMessageResponse {
    @JsonProperty("successful_receiver_uuids")
    private List<String> successfulReceiverUuids;

}
