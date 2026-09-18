const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

// Example mock data
let users = [
  { id: 1, name: "Nnamdi", age: 28, goal: "Build muscle" },
  { id: 2, name: "Ada", age: 25, goal: "Lose weight" }
];

let workouts = [
  { id: 1, userId: 1, type: "Cardio", duration: 45, date: "2026-07-15" },
  { id: 2, userId: 1, type: "Strength", duration: 60, date: "2026-07-16" }
];

// Routes
app.get('/users', (req, res) => res.json(users));
app.get('/workouts', (req, res) => {
  if (req.query.userId) {
    return res.json(workouts.filter(w => w.userId == req.query.userId));
  }
  res.json(workouts);
});
app.post('/workouts', (req, res) => {
  const newWorkout = { id: workouts.length + 1, ...req.body };
  workouts.push(newWorkout);
  res.status(201).json(newWorkout);
});

// Start server
app.listen(3000, () => console.log('Mock API running on http://localhost:3000'));
