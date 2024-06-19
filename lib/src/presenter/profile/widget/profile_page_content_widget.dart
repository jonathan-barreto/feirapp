import 'package:feirapp/src/presenter/profile/widget/profile_row_option_widget.dart';
import 'package:feirapp/src/presenter/profile/widget/profile_user_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePageContentWidget extends StatelessWidget {
  final String name;

  const ProfilePageContentWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileUserDataWidget(
          name: name,
        ),
        const ProfileRowOptionWidget(
          label: 'Meu Perfil',
          iconData: FontAwesomeIcons.solidUser,
        ),
        const ProfileRowOptionWidget(
          label: 'Notificações',
          iconData: FontAwesomeIcons.solidBell,
        ),
        const ProfileRowOptionWidget(
          label: 'Pedidos',
          iconData: FontAwesomeIcons.ticket,
        ),
        const ProfileRowOptionWidget(
          label: 'Endereço',
          iconData: FontAwesomeIcons.locationDot,
        ),
        const ProfileRowOptionWidget(
          label: 'Pagamento',
          iconData: FontAwesomeIcons.creditCard,
        ),
        const ProfileRowOptionWidget(
          label: 'Suporte',
          iconData: FontAwesomeIcons.headset,
        ),
      ],
    );
  }
}