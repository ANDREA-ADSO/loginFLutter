import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Handle error, e.g., show snackbar
      print('Could not launch $url');
    }
  }

  void _launchPhone(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _launchEmail(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ayuda y Contacto',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Si necesitas asistencia, contacta con nuestro equipo de soporte. Estamos aquí para ayudarte con cualquier duda sobre la app o servicios.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Información de Contacto:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      leading: const Icon(Icons.person, color: Colors.blue),
                      title: const Text('Nombre: Wasab'),
                      subtitle: const Text('Soporte técnico'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.green),
                      title: const Text('Teléfono: 3143623191'),
                      trailing: IconButton(
                        icon: const Icon(Icons.call, color: Colors.green),
                        onPressed: () => _launchPhone('3143623191'),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.red),
                      title: const Text('Correo: megalava@gmail.com'),
                      trailing: IconButton(
                        icon: const Icon(Icons.email, color: Colors.red),
                        onPressed: () => _launchEmail('megalava@gmail.com'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      leading: const Icon(Icons.message, color: Colors.green),
                      title: const Text('WhatsApp: 3143623191'),
                      subtitle: const Text('Envía un mensaje rápido'),
                      trailing: IconButton(
                        icon: const Icon(Icons.send, color: Colors.green),
                        onPressed: () => _launchURL('https://wa.me/573143623191'), // Asumiendo código de país +57 para Colombia
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Horario de atención: Lunes a Viernes, 9:00 AM - 6:00 PM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '¡Gracias por usar MegaLavado! Tu satisfacción es nuestra prioridad.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
