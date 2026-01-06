import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_final/core/constants/constants.dart';

class HomeCvPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.homeTitle,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(AppConstants.primaryColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              duration: Duration(seconds: 1),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/profile.jpeg'), // Your photo
              ),
            ),
            SizedBox(height: 20),
            FadeInLeft(
              duration: Duration(seconds: 1),
              delay: Duration(milliseconds: 500),
              child: Text(
                'SAAD SABIR IDRISSI',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(AppConstants.textColor),
                ),
              ),
            ),
            SizedBox(height: 10),
            FadeInRight(
              duration: Duration(seconds: 1),
              delay: Duration(milliseconds: 1000),
              child: Text(
                'Étudiant en ingénierie informatique à la recherche d’une Alternance',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Color(AppConstants.secondaryColor),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            FadeInUp(
              duration: Duration(seconds: 1),
              delay: Duration(milliseconds: 1500),
              child: _buildSection('Profil', 'Étudiant en ingénierie informatique passionné par les technologies, l\'IA et le développement logiciel. À la recherche d\'une alternance pour appliquer mes compétences en Big Data et développement.'),
            ),
            SizedBox(height: 20),
            _buildSkillsSection(),
            SizedBox(height: 20),
            _buildSection('Formation', 'Double diplomation en Big Data\nYiwu Industrial and Commercial College\nOct.2025 - Sept.2028 (En cours)\n\nDiplôme d’ingénieur\nUniversité Mundiapolis\nSept.2024 - Sept.2027 (En cours)\n\nCycle préparatoire\nUniversité de Mundiapolis - Maroc\nSept 2022 - Juin 2024'),
            SizedBox(height: 20),
            _buildSection('Contact', 'Email: saadsabiridrissi@gmail.com\nTéléphone: 06.16.42.80.88\nMobilité: Nationale\nLinkedIn: www.linkedin.com/in/saad-sabir-idrissi\nPermis: B'),
            SizedBox(height: 20),
            _buildSection('Langues', 'Français: Courant\nAnglais: Niveau B2\nArabe: Maternelle'),
            SizedBox(height: 20),
            _buildSection('Certifications', 'NXP CUP Intelligent Car Racing\nALX: AI Career Essentials\nAWS Cloud Certification\nHuawei Cloud Certification'),
            SizedBox(height: 20),
            _buildSection('Projets', 'SmartHousing Clustering - Analyse de données immobilières (Nov.2025)\n• Application de l’algorithme K-means pour regrouper les appartements selon la surface et le prix.\n• Classification des appartements en différentes catégories (économique, moyen, haut standing).\n• Mots clés: Python, Machine Learning, K-means\n\nGameZone Store - Site web e-commerce gaming (Mars.2025 - Avril.2025)\n• Création d’un site web pour vendre du matériel de gaming.\n• Développement de l’interface avec HTML, CSS et JavaScript.\n• Design simple et responsive pour tous les appareils.\n• Mots clés: HTML5, CSS3, JavaScript, Python'),
            SizedBox(height: 20),
            _buildSection('Expériences', 'Responsable Recrutement et Onboarding\nClub Legends Mundiapolis - Casablanca\nSept 2022 - Aujourd’hui\n• Gestion du recrutement des membres et intégration des nouveaux arrivants.\n• Organisation d’événements et d’ateliers pour renforcer l’esprit d’équipe et la cohésion interne.\n\nJob étudiant\nKonecta Call Center - Casablanca\nJuin.2024 - Août.2024\n• Chargé de la télévente pour Engie, spécialisé dans la persuasion et la conversion des prospects en clients.\n• Développement des compétences en communication et en service.\n\nStage d’observation\nAssurance Allianz - Casablanca\nJuil. 2023 - Août 2023\n• Observation des activités du département informatique.\n• Acquisition d’une compréhension pratique des processus et des outils utilisés dans le domaine de l’assurance.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    List<String> skills = [
      'Python', 'Power Bi', 'Data Analyst', 'Java', 'Arduino', 'HTML5', 'C', 'SQL',
      'Excel', 'Data Modeling', 'Numpy', 'Linux', 'UML', 'MCD', 'Dart', 'Docker',
      'Génie logiciel', 'Flexibilité', 'Adaptabilité', 'Gestion de projet', 'Curiosité'
    ];
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Compétences et Points Forts',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(AppConstants.primaryColor),
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: skills.map((skill) => Chip(
              label: Text(skill, style: GoogleFonts.poppins(color: Colors.white)),
              backgroundColor: Color(AppConstants.primaryColor),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(AppConstants.primaryColor),
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color(AppConstants.textColor),
            ),
          ),
        ],
      ),
    );
  }
}