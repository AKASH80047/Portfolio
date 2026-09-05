import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/portfolio_constants.dart';
import '../../../core/responsive/responsive_layout.dart';
import '../../../core/utils/url_launcher_util.dart';
import '../../../shared/widgets/brand_icons.dart';
import '../../../shared/widgets/next_section_banner.dart';

class ContactScreen extends StatefulWidget {
  final VoidCallback? onNextSection;

  const ContactScreen({super.key, this.onNextSection});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    await UrlLauncherUtil.openUrl(url);
  }

  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text('$label copied to clipboard!'),
          ],
        ),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _sendMessage() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (name.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text('Please enter your name and message.'),
            ],
          ),
          backgroundColor: Colors.orange.shade800,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    final subject = Uri.encodeComponent("Contact Message from $name");
    final body = Uri.encodeComponent(
      "Hi Akash,\n\n"
      "Name: $name\n"
      "Email: ${email.isNotEmpty ? email : 'Not provided'}\n\n"
      "Message:\n$message\n\n"
      "---\nSent via Portfolio Contact Form",
    );
    final mailtoUrl =
        "mailto:${PortfolioConstants.email}?subject=$subject&body=$body";
    await _launchUrl(mailtoUrl);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 18, vertical: 12),
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Availability Badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: const Color(0xFF10B981).withValues(alpha: 0.4)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: Color(0xFF34D399), size: 8),
                    SizedBox(width: 8),
                    Text(
                      'AVAILABLE FOR CONTRACTS & FULL-TIME ROLES',
                      style: TextStyle(
                        color: Color(0xFF34D399),
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Title & Subtitle
              Text(
                "Let's Build Something Extraordinary",
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontSize: isMobile ? 24 : 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Have an innovative mobile app, scalable Clean Architecture requirement, or Generative AI engineering opportunity? Let's connect directly.",
                style: TextStyle(
                  fontSize: isMobile ? 13.5 : 15,
                  color: Colors.grey.shade300,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),

              // Credibility Mini Strip
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: [
                  _buildPillBadge(Icons.bolt, 'Average Response: < 2 Hours',
                      const Color(0xFFF59E0B)),
                  _buildPillBadge(
                      Icons.public,
                      'Timezone: IST (Flexible US/EU overlap)',
                      const Color(0xFF38BDF8)),
                  _buildPillBadge(Icons.verified,
                      '10% Upwork Job Success Score', const Color(0xFF10B981)),
                ],
              ),
              const SizedBox(height: 28),

              // 2. MAIN 2-COLUMN GRID (Cards Left, Form Right on Desktop)
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 840;

                  return isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left Column: Direct Action Cards (WhatsApp, Email, Call, Socials)
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  _buildFeaturedChannelCard(
                                    title: 'WhatsApp Instant Chat',
                                    badge: '⚡ FASTEST RESPONSE (<15 MINS)',
                                    value: PortfolioConstants.phone,
                                    actionLabel: 'Chat on WhatsApp',
                                    actionIcon: Icons.chat_bubble_outline,
                                    accentColor: const Color(0xFF25D366),
                                    iconWidget:
                                        const WhatsappBrandIcon(size: 24),
                                    onTapAction: () => _launchUrl(
                                        PortfolioConstants.whatsappUrl),
                                    onCopy: () => _copyToClipboard(
                                        PortfolioConstants.phone,
                                        'Phone number'),
                                  ),
                                  const SizedBox(height: 14),
                                  _buildFeaturedChannelCard(
                                    title: 'Direct Email',
                                    badge: 'OFFICIAL & CONTRACT INQUIRIES',
                                    value: PortfolioConstants.email,
                                    actionLabel: 'Send Direct Email',
                                    actionIcon: Icons.outgoing_mail,
                                    accentColor: const Color(0xFF3B82F6),
                                    iconWidget: const Icon(Icons.email_outlined,
                                        color: Color(0xFF60A5FA), size: 24),
                                    onTapAction: () => _launchUrl(
                                        'mailto:${PortfolioConstants.email}'),
                                    onCopy: () => _copyToClipboard(
                                        PortfolioConstants.email,
                                        'Email address'),
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _buildMiniSocialCard(
                                          title: 'LinkedIn',
                                          subtitle: 'Connect & Network',
                                          iconWidget:
                                              const LinkedinBrandIcon(size: 20),
                                          accentColor: const Color(0xFF0A66C2),
                                          onTap: () => _launchUrl(
                                              PortfolioConstants.linkedinUrl),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: _buildMiniSocialCard(
                                          title: 'GitHub',
                                          subtitle: '30+ Public Repos',
                                          iconWidget:
                                              const GithubBrandIcon(size: 20),
                                          accentColor: const Color(0xFF8B5CF6),
                                          onTap: () => _launchUrl(
                                              PortfolioConstants.githubUrl),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  _buildMiniSocialCard(
                                    title: 'Direct Phone Call',
                                    subtitle:
                                        '+91 74283 42558 (Voice & Telecon)',
                                    iconWidget: const Icon(Icons.phone_in_talk,
                                        color: Color(0xFF10B981), size: 20),
                                    accentColor: const Color(0xFF10B981),
                                    onTap: () => _launchUrl(
                                        'tel:${PortfolioConstants.phone}'),
                                    onCopy: () => _copyToClipboard(
                                        PortfolioConstants.phone,
                                        'Phone number'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),

                            // Right Column: Direct Message Form Card
                            Expanded(
                              flex: 6,
                              child: _buildQuickInquiryCard(context, theme),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            // Mobile Stack
                            _buildFeaturedChannelCard(
                              title: 'WhatsApp Instant Chat',
                              badge: '⚡ FASTEST RESPONSE (<15 MINS)',
                              value: PortfolioConstants.phone,
                              actionLabel: 'Chat on WhatsApp',
                              actionIcon: Icons.chat_bubble_outline,
                              accentColor: const Color(0xFF25D366),
                              iconWidget: const WhatsappBrandIcon(size: 24),
                              onTapAction: () =>
                                  _launchUrl(PortfolioConstants.whatsappUrl),
                              onCopy: () => _copyToClipboard(
                                  PortfolioConstants.phone, 'Phone number'),
                            ),
                            const SizedBox(height: 14),
                            _buildFeaturedChannelCard(
                              title: 'Direct Email',
                              badge: 'OFFICIAL & CONTRACT INQUIRIES',
                              value: PortfolioConstants.email,
                              actionLabel: 'Send Direct Email',
                              actionIcon: Icons.outgoing_mail,
                              accentColor: const Color(0xFF3B82F6),
                              iconWidget: const Icon(Icons.email_outlined,
                                  color: Color(0xFF60A5FA), size: 24),
                              onTapAction: () => _launchUrl(
                                  'mailto:${PortfolioConstants.email}'),
                              onCopy: () => _copyToClipboard(
                                  PortfolioConstants.email, 'Email address'),
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildMiniSocialCard(
                                    title: 'LinkedIn',
                                    subtitle: 'Connect & Network',
                                    iconWidget:
                                        const LinkedinBrandIcon(size: 20),
                                    accentColor: const Color(0xFF0A66C2),
                                    onTap: () => _launchUrl(
                                        PortfolioConstants.linkedinUrl),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: _buildMiniSocialCard(
                                    title: 'GitHub',
                                    subtitle: '30+ Public Repos',
                                    iconWidget: const GithubBrandIcon(size: 20),
                                    accentColor: const Color(0xFF8B5CF6),
                                    onTap: () => _launchUrl(
                                        PortfolioConstants.githubUrl),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            _buildMiniSocialCard(
                              title: 'Direct Phone Call',
                              subtitle: '+91 74283 42558 (Voice & Telecon)',
                              iconWidget: const Icon(Icons.phone_in_talk,
                                  color: Color(0xFF10B981), size: 20),
                              accentColor: const Color(0xFF10B981),
                              onTap: () =>
                                  _launchUrl('tel:${PortfolioConstants.phone}'),
                              onCopy: () => _copyToClipboard(
                                  PortfolioConstants.phone, 'Phone number'),
                            ),
                            const SizedBox(height: 20),
                            _buildQuickInquiryCard(context, theme),
                          ],
                        );
                },
              ),

              // NEXT SECTION BANNER (Return to Home)
              if (widget.onNextSection != null)
                NextSectionBanner(
                  title: 'Back to Home Overview',
                  subtitle: 'Explore hero, live demos, and core stack overview',
                  icon: Icons.home_outlined,
                  accentColor: const Color(0xFF10B981),
                  onTap: widget.onNextSection!,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPillBadge(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 13),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedChannelCard({
    required String title,
    required String badge,
    required String value,
    required String actionLabel,
    required IconData actionIcon,
    required Color accentColor,
    required Widget iconWidget,
    required VoidCallback onTapAction,
    VoidCallback? onCopy,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF131C2E),
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: accentColor.withValues(alpha: 0.35), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: accentColor.withValues(alpha: 0.3)),
                ),
                child: Center(child: iconWidget),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      badge,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 9.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (onCopy != null)
                IconButton(
                  icon: const Icon(Icons.copy_rounded,
                      size: 18, color: Colors.grey),
                  tooltip: 'Copy to clipboard',
                  onPressed: onCopy,
                ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0B1120),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFFE2E8F0),
              ),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onTapAction,
              style: FilledButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
              icon: Icon(actionIcon, size: 16),
              label: Text(
                actionLabel,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniSocialCard({
    required String title,
    required String subtitle,
    required Widget iconWidget,
    required Color accentColor,
    required VoidCallback onTap,
    VoidCallback? onCopy,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF131C2E),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: accentColor.withValues(alpha: 0.3)),
              ),
              child: Center(child: iconWidget),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.5,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_outward_rounded,
                size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickInquiryCard(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF131C2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.mail_outline_rounded,
                    color: theme.colorScheme.primary, size: 20),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  Text(
                    'Send a direct message',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 28),

          // Name Field
          TextField(
            controller: _nameController,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecoration(
              labelText: 'Name *',
              hintText: 'Your Name',
              prefixIcon: const Icon(Icons.person_outline, size: 18),
              filled: true,
              fillColor: const Color(0xFF0B1120),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
          const SizedBox(height: 14),

          // Email Field
          TextField(
            controller: _emailController,
            style: const TextStyle(fontSize: 13),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Your Email / Phone',
              prefixIcon: const Icon(Icons.email_outlined, size: 18),
              filled: true,
              fillColor: const Color(0xFF0B1120),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
          const SizedBox(height: 14),

          // Message Field
          TextField(
            controller: _messageController,
            style: const TextStyle(fontSize: 13),
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Message *',
              hintText: 'Write your message...',
              filled: true,
              fillColor: const Color(0xFF0B1120),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.all(14),
            ),
          ),
          const SizedBox(height: 20),

          // Submit Action
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _sendMessage,
              style: FilledButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              icon: const Icon(Icons.send_rounded, size: 16),
              label: const Text(
                'Send Message',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
