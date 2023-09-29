// To parse this JSON data, do
//
//     final textToImageModel = textToImageModelFromJson(jsonString);

import 'dart:convert';

TextToImageModel textToImageModelFromJson(String str) => TextToImageModel.fromJson(json.decode(str));

String textToImageModelToJson(TextToImageModel data) => json.encode(data.toJson());

class TextToImageModel {
  String? status;
  double? generationTime;
  int? id;
  List<String>? output;
  Meta? meta;

  TextToImageModel({
    this.status,
    this.generationTime,
    this.id,
    this.output,
    this.meta,
  });

  factory TextToImageModel.fromJson(Map<String, dynamic> json) => TextToImageModel(
    status: json["status"],
    generationTime: json["generationTime"].toDouble(),
    id: json["id"],
    output: List<String>.from(json["output"].map((x) => x)),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "generationTime": generationTime,
    "id": id,
    "output": List<dynamic>.from(output!.map((x) => x)),
    "meta": meta?.toJson(),
  };
}

class Meta {
  int? h;
  int? w;
  String? enableAttentionSlicing;
  String? filePrefix;
  double? guidanceScale;
  String? model;
  int? nSamples;
  String? negativePrompt;
  String? outdir;
  String? prompt;
  String? revision;
  String? safetychecker;
  int? seed;
  int? steps;
  String? vae;

  Meta({
    this.h,
    this.w,
    this.enableAttentionSlicing,
    this.filePrefix,
    this.guidanceScale,
    this.model,
    this.nSamples,
    this.negativePrompt,
    this.outdir,
    this.prompt,
    this.revision,
    this.safetychecker,
    this.seed,
    this.steps,
    this.vae,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    h: json["H"],
    w: json["W"],
    enableAttentionSlicing: json["enable_attention_slicing"],
    filePrefix: json["file_prefix"],
    guidanceScale: json["guidance_scale"].toDouble(),
    model: json["model"],
    nSamples: json["n_samples"],
    negativePrompt: json["negative_prompt"],
    outdir: json["outdir"],
    prompt: json["prompt"],
    revision: json["revision"],
    safetychecker: json["safetychecker"],
    seed: json["seed"],
    steps: json["steps"],
    vae: json["vae"],
  );

  Map<String, dynamic> toJson() => {
    "H": h,
    "W": w,
    "enable_attention_slicing": enableAttentionSlicing,
    "file_prefix": filePrefix,
    "guidance_scale": guidanceScale,
    "model": model,
    "n_samples": nSamples,
    "negative_prompt": negativePrompt,
    "outdir": outdir,
    "prompt": prompt,
    "revision": revision,
    "safetychecker": safetychecker,
    "seed": seed,
    "steps": steps,
    "vae": vae,
  };
}
