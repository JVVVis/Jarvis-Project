# Jvis Backend API

Node.js/Express backend for the Jvis AI mobile assistant.

## Setup

```bash
npm install
npm start
```

## Environment Variables

Create a `.env` file:

```
PORT=3000
AI_API_KEY=your_openai_api_key
AI_MODEL=gpt-4
NODE_ENV=development
```

## API Endpoints

- `POST /api/chat` - Send message and get AI response
- `GET /api/history` - Get conversation history
- `DELETE /api/history` - Clear conversation history
- `POST /api/voice/transcribe` - Transcribe audio to text
- `POST /api/voice/synthesize` - Convert text to speech

## Architecture

- **Express.js** - Web framework
- **OpenAI API** - AI conversation engine
- **JWT** - Authentication
- **MongoDB** - Conversation storage
