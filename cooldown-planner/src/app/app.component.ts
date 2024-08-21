import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import * as palacePlan from '../assets/palace_plan.json';
import * as heals from '../assets/heals.json';
import * as palace from '../assets/palace.json';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'cooldown-planner';

  palacePlan: any = palacePlan;


  ngOnInit() {
    console.log(this.palacePlan);
  }

}
