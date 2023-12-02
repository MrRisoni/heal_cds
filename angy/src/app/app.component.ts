import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'angy';

  constructor(private http: HttpClient) {

    this.fetchAssignments();
  }

  private fetchAssignments()
  {
    this.http.get('http://localhost:8000/mrt/boss/assigns/6')
    .subscribe((res) => {
      console.log(res);
    })
  }
}
