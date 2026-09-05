class ProjectModel {
  final String id;
  final String name;
  final String badge;
  final String category;
  final String problemStatement;
  final String solutionStatement;
  final String myRole;
  final String shortDescription;
  final String fullDescription;
  final String stateManagementDetail;
  final String image;
  final List<String> gallery;
  final List<String> technologies;
  final List<String> features;
  final String architecture;
  final String challenges;
  final String solution;
  final String githubUrl;
  final String? liveDemoUrl;
  final String? apkUrl;
  final bool isFeatured;
  final Map<String, String> techExplanations;

  const ProjectModel({
    required this.id,
    required this.name,
    required this.badge,
    required this.category,
    required this.problemStatement,
    required this.solutionStatement,
    required this.myRole,
    required this.shortDescription,
    required this.fullDescription,
    required this.stateManagementDetail,
    required this.image,
    required this.gallery,
    required this.technologies,
    required this.features,
    required this.architecture,
    required this.challenges,
    required this.solution,
    required this.githubUrl,
    this.liveDemoUrl,
    this.apkUrl,
    this.isFeatured = true,
    this.techExplanations = const {},
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      name: json['name'] as String,
      badge: json['badge'] as String? ?? 'Flutter',
      category: json['category'] as String? ?? 'Flutter',
      problemStatement: json['problemStatement'] as String? ?? '',
      solutionStatement: json['solutionStatement'] as String? ?? '',
      myRole: json['myRole'] as String? ?? 'Flutter Developer',
      shortDescription: json['shortDescription'] as String? ?? '',
      fullDescription: json['fullDescription'] as String? ?? '',
      stateManagementDetail: json['stateManagementDetail'] as String? ?? '',
      image: json['image'] as String? ?? 'assets/images/medipoints_project.svg',
      gallery: (json['gallery'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      technologies: (json['technologies'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      features: (json['features'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      architecture: json['architecture'] as String? ?? '',
      challenges: json['challenges'] as String? ?? '',
      solution: json['solution'] as String? ?? '',
      githubUrl: json['githubUrl'] as String? ?? '',
      liveDemoUrl: json['liveDemoUrl'] as String?,
      apkUrl: json['apkUrl'] as String?,
      isFeatured: json['isFeatured'] as bool? ?? true,
      techExplanations: (json['techExplanations'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, value.toString())) ?? const {},
    );
  }
}

class GitHubRepoModel {
  final String name;
  final String? description;
  final String htmlUrl;
  final String? language;
  final int stargazersCount;
  final int forksCount;
  final String updatedAt;
  final List<String> topics;

  const GitHubRepoModel({
    required this.name,
    this.description,
    required this.htmlUrl,
    this.language,
    required this.stargazersCount,
    required this.forksCount,
    required this.updatedAt,
    required this.topics,
  });

  factory GitHubRepoModel.fromJson(Map<String, dynamic> json) {
    return GitHubRepoModel(
      name: json['name'] as String,
      description: json['description'] as String?,
      htmlUrl: json['html_url'] as String? ?? 'https://github.com/AKASH80047/${json['name']}',
      language: json['language'] as String? ?? 'Dart',
      stargazersCount: (json['stargazers_count'] as num?)?.toInt() ?? 0,
      forksCount: (json['forks_count'] as num?)?.toInt() ?? 0,
      updatedAt: json['updated_at'] as String? ?? '2026',
      topics: (json['topics'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? ['flutter', 'dart'],
    );
  }
}
