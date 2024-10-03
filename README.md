# Dungeons & Dragons Wiki App

This is a **Dungeons & Dragons Wiki-style** web application built using **Ruby on Rails** with **PostgreSQL**, **TailwindCSS** for styling, and **Devise** for user authentication. The app is styled with an "Ancient Scroll/Arcane Magic" theme to match the fantasy world of D&D.

## Technologies Used
- **Ruby on Rails** (Backend framework)
- **PostgreSQL** (Database)
- **TailwindCSS** (CSS framework)
- **Devise** (User authentication)
- **GraphQL** (API support)
- **Hotwire / Turbo** (For real-time features)
- **Stimulus** (JavaScript controllers)

## Installation

1. **Clone the Repository:**

   ```bash
   git clone <repository_url>
   cd dnd-wiki
   ```

2. **Install Dependencies:**

   Make sure you have Ruby, Node.js, and PostgreSQL installed.

   - Install Ruby gems:

     ```bash
     bundle install
     ```

   - Install JavaScript dependencies:

     ```bash
     yarn install
     ```

3. **Database Setup:**

   Set up the database:

   - Create the database:
   
     ```bash
     rails db:create
     rails db:migrate
     ```

   Make sure the `config/database.yml` is configured correctly with your PostgreSQL username and password.

4. **Run the Server:**

   Start the Rails server:

   ```bash
   rails server
   ```

   The app will be accessible at `http://localhost:3000`.

## Features Implemented

### 1. **Devise User Authentication**
   - User registration, login, and password management.
   - User account confirmation using email (Confirmable).
   - Password recovery using Devise.

### 2. **Styling with TailwindCSS**
   - A custom "Ancient Scroll/Arcane Magic" theme has been applied with colors like **#3b3a30** (Deep Slate Gray), **#b39c6d** (Burnished Gold), **#7d5a50** (Dusty Rose), and **#b3c100** (Acid Green).
   - Forms are styled with consistent spacing, padding, and hover/focus effects to improve the user experience.

### 3. **GraphQL API Support**
   - The project includes a simple GraphQL setup with `/graphiql` for testing in the development environment.

## Known Issues / TODO
- Further enhance form styling and layout for mobile responsiveness.
- Complete the core Dungeons & Dragons data structure, such as spells, monsters, items, etc., using an external API.
- Implement Turbo Frames and Hotwire to improve dynamic features without requiring page reloads.


## Contribution
Feel free to open an issue or create a pull request if you would like to contribute to the project.

## License
This project is licensed under the MIT License.
