/**
 * Akash Pandey — GitHub API Service
 * Fetches public repositories for username AKASH80047.
 * Handles rate limits, errors, and provides local fallback data.
 */

class GitHubService {
  constructor(username = PORTFOLIO_CONFIG.personal.githubUsername) {
    this.username = username;
    this.apiUrl = `https://api.github.com/users/${username}/repos?sort=updated&per_page=100`;
    this.userUrl = `https://api.github.com/users/${username}`;
    this.cacheKeyRepos = `akash_github_repos_${username}`;
    this.cacheKeyUser = `akash_github_user_${username}`;
  }

  async fetchUserProfile() {
    const cached = sessionStorage.getItem(this.cacheKeyUser);
    if (cached) {
      return JSON.parse(cached);
    }

    try {
      const response = await fetch(this.userUrl);
      if (!response.ok) throw new Error(`GitHub API Error: ${response.status}`);
      const data = await response.json();
      sessionStorage.setItem(this.cacheKeyUser, JSON.stringify(data));
      return data;
    } catch (err) {
      console.warn("GitHub user profile fetch failed, using fallback profile data:", err);
      return {
        login: "AKASH80047",
        name: "Akash Pandey",
        bio: "Flutter Developer | Mobile App Developer | Firebase | REST APIs | Clean Architecture",
        public_repos: 32,
        followers: 1,
        following: 2,
        html_url: PORTFOLIO_CONFIG.personal.githubUrl,
        avatar_url: PORTFOLIO_CONFIG.personal.profileImage
      };
    }
  }

  async fetchRepositories() {
    const cached = sessionStorage.getItem(this.cacheKeyRepos);
    if (cached) {
      return JSON.parse(cached);
    }

    try {
      const response = await fetch(this.apiUrl);
      if (!response.ok) throw new Error(`GitHub API Error: ${response.status}`);
      const repos = await response.json();
      
      const formattedRepos = repos.map(repo => ({
        id: repo.name.toLowerCase().replace(/[^a-z0-9]/g, '-'),
        name: repo.name,
        description: repo.description || "Flutter & Dart application repository.",
        githubUrl: repo.html_url,
        language: repo.language || "Flutter",
        stars: repo.stargazers_count,
        forks: repo.forks_count,
        updatedAt: new Date(repo.updated_at).toLocaleDateString("en-US", { month: "short", year: "numeric" }),
        topics: repo.topics || ["flutter", "dart"],
        isFeatured: false,
        image: this.getRepoPlaceholderImage(repo.name, repo.language)
      }));

      sessionStorage.setItem(this.cacheKeyRepos, JSON.stringify(formattedRepos));
      return formattedRepos;
    } catch (err) {
      console.warn("GitHub repos fetch failed, trying local github_repos.json fallback:", err);
      try {
        const localRes = await fetch("github_repos.json");
        if (localRes.ok) {
          const repos = await localRes.json();
          const formatted = repos.map(repo => ({
            id: repo.name.toLowerCase().replace(/[^a-z0-9]/g, '-'),
            name: repo.name,
            description: repo.description || "Flutter & Dart application repository.",
            githubUrl: repo.html_url,
            language: repo.language || "Flutter",
            stars: repo.stargazers_count,
            forks: repo.forks_count,
            updatedAt: new Date(repo.updated_at).toLocaleDateString("en-US", { month: "short", year: "numeric" }),
            topics: repo.topics || ["flutter", "dart"],
            isFeatured: false,
            image: this.getRepoPlaceholderImage(repo.name, repo.language)
          }));
          return formatted;
        }
      } catch (localErr) {
        console.warn("Local json fallback failed, using hardcoded fallback:", localErr);
      }
      return this.getFallbackRepositories();
    }
  }

  getRepoPlaceholderImage(repoName, language) {
    const nameLower = repoName.toLowerCase();
    if (nameLower.includes("medi")) return "assets/images/medipoints_project.svg";
    if (nameLower.includes("apple") || nameLower.includes("cart") || nameLower.includes("shop")) return "assets/images/applecart_project.svg";
    if (nameLower.includes("exam") || nameLower.includes("quiz")) return "assets/images/exam_project.svg";
    if (nameLower.includes("attend") || nameLower.includes("employee")) return "assets/images/attendance_project.svg";
    if (nameLower.includes("dairy") || nameLower.includes("farm")) return "assets/images/dairy_project.svg";
    if (nameLower.includes("peblo") || nameLower.includes("story")) return "assets/images/peblo_project.svg";
    if (nameLower.includes("animat") || nameLower.includes("ui")) return "assets/images/animation_project.svg";
    return "assets/images/medipoints_project.svg";
  }

  getFallbackRepositories() {
    return PORTFOLIO_CONFIG.featuredProjects.map(proj => ({
      id: proj.id,
      name: proj.name,
      description: proj.shortDescription,
      githubUrl: proj.githubUrl,
      language: proj.category,
      stars: 5,
      forks: 2,
      updatedAt: "2026",
      topics: proj.technologies.slice(0, 4),
      isFeatured: true,
      image: proj.image
    }));
  }
}

window.GitHubService = GitHubService;
