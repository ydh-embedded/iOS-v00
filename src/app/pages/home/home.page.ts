import { Component } from '@angular/core';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  features = [
    {
      icon: '📱',
      title: 'Cross-Platform',
      description: 'Works on iOS and Android'
    },
    {
      icon: '⚡',
      title: 'Performance',
      description: 'Native-like performance'
    },
    {
      icon: '🔧',
      title: 'Native APIs',
      description: 'Access device features'
    }
  ];

  constructor(private alertController: AlertController) {}

  async showFeatures() {
    const alert = await this.alertController.create({
      header: '🚀 Features',
      message: 'This app includes cross-platform support, native performance, and device API access.',
      buttons: ['Awesome!']
    });

    await alert.present();
  }

}
