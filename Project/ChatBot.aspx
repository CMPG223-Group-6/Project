<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChatBot.aspx.cs" Inherits="Project.ChatBot" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>🦁 ZIMS Chat Assistant</title>
    <style>
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #e9f5f0 0%, #d4e8df 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .chat-container {
            width: 500px;
            max-width: 96vw;
            height: 650px;
            max-height: 95vh;
            background: #ffffff;
            border-radius: 28px;
            box-shadow: 0 12px 40px rgba(0, 40, 20, 0.25);
            display: flex;
            flex-direction: column;
            overflow: hidden;
            border: 1px solid rgba(44, 110, 73, 0.2);
        }

        .chat-header {
            background: #2c6e49;
            color: white;
            padding: 18px 24px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-bottom: 2px solid #1f4d34;
        }
        .chat-header .icon {
            font-size: 30px;
        }
        .chat-header .title {
            font-size: 20px;
            font-weight: 700;
            letter-spacing: 0.3px;
        }
        .chat-header .subtitle {
            font-size: 13px;
            opacity: 0.85;
            font-weight: 400;
            margin-top: 2px;
        }
        .chat-header .spacer {
            flex: 1;
        }
        .chat-header .close-btn {
            background: rgba(255,255,255,0.15);
            border: none;
            color: white;
            font-size: 24px;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            transition: 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }
        .chat-header .close-btn:hover {
            background: rgba(255,255,255,0.30);
        }

        .chat-messages {
            flex: 1;
            padding: 20px 18px;
            overflow-y: auto;
            background: #f8faf9;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .message {
            max-width: 82%;
            padding: 12px 18px;
            border-radius: 20px;
            font-size: 15px;
            line-height: 1.5;
            word-wrap: break-word;
            animation: fadeSlide 0.25s ease-out;
            box-shadow: 0 1px 3px rgba(0,0,0,0.06);
        }
        .message.user {
            background: #2c6e49;
            color: white;
            align-self: flex-end;
            border-bottom-right-radius: 4px;
        }
        .message.bot {
            background: #e9edec;
            color: #1e2b26;
            align-self: flex-start;
            border-bottom-left-radius: 4px;
        }
        .message.bot .emoji {
            font-size: 18px;
            margin-right: 6px;
        }

        @keyframes fadeSlide {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .typing-indicator {
            display: none;
            align-self: flex-start;
            background: #e9edec;
            padding: 12px 20px;
            border-radius: 20px;
            border-bottom-left-radius: 4px;
            font-size: 14px;
            color: #4a5a52;
        }
        .typing-indicator .dots span {
            display: inline-block;
            width: 8px;
            height: 8px;
            background: #6b8a7a;
            border-radius: 50%;
            margin: 0 2px;
            animation: bounce 1.4s infinite both;
        }
        .typing-indicator .dots span:nth-child(2) { animation-delay: 0.2s; }
        .typing-indicator .dots span:nth-child(3) { animation-delay: 0.4s; }
        @keyframes bounce {
            0%, 80%, 100% { transform: scale(0.6); opacity: 0.4; }
            40% { transform: scale(1); opacity: 1; }
        }

        .quick-actions {
            padding: 8px 20px 6px 20px;
            background: white;
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            border-bottom: 1px solid #e0e8e3;
        }
        .quick-btn {
            background: #e8f0ec;
            border: 1px solid #c0d6cc;
            border-radius: 20px;
            padding: 6px 14px;
            font-size: 13px;
            cursor: pointer;
            transition: 0.2s;
            color: #1e4d34;
            font-weight: 500;
            white-space: nowrap;
        }
        .quick-btn:hover {
            background: #2c6e49;
            color: white;
            border-color: #2c6e49;
        }

        .chat-input-area {
            display: flex;
            gap: 10px;
            padding: 14px 20px 18px 20px;
            background: white;
            border-top: 1px solid #e0e8e3;
            align-items: center;
        }
        .chat-input-area input {
            flex: 1;
            border: 2px solid #dce6e0;
            border-radius: 30px;
            padding: 12px 20px;
            font-size: 15px;
            outline: none;
            transition: 0.2s;
            background: #fafcfa;
        }
        .chat-input-area input:focus {
            border-color: #2c6e49;
            background: white;
            box-shadow: 0 0 0 4px rgba(44, 110, 73, 0.10);
        }
        .chat-input-area button {
            background: #2c6e49;
            color: white;
            border: none;
            border-radius: 30px;
            padding: 12px 28px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
            white-space: nowrap;
            min-width: 80px;
        }
        .chat-input-area button:hover {
            background: #1f4d34;
            transform: scale(1.02);
        }
        .chat-input-area button:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .chat-messages::-webkit-scrollbar {
            width: 5px;
        }
        .chat-messages::-webkit-scrollbar-track {
            background: transparent;
        }
        .chat-messages::-webkit-scrollbar-thumb {
            background: #b8ccc0;
            border-radius: 10px;
        }
        .chat-messages::-webkit-scrollbar-thumb:hover {
            background: #94aea0;
        }

        .back-link {
            text-align: center;
            padding: 6px 0 0 0;
            background: white;
            font-size: 13px;
        }
        .back-link a {
            color: #2c6e49;
            text-decoration: none;
            font-weight: 500;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="chat-container">

        <div class="chat-header">
            <span class="icon">🦁</span>
            <div>
                <div class="title">ZIMS Assistant</div>
                <div class="subtitle">Natal Zoological Gardens</div>
            </div>
            <span class="spacer"></span>
            <a href="Default.aspx" class="close-btn" title="Close Chat">✕</a>
        </div>

        <div class="chat-messages" id="chatMessages">
            <div class="message bot">
                <span class="emoji">👋</span> Hi there! I'm the ZIMS virtual assistant.<br />
                Ask me about <strong>bookings, payments, events, reports, tourists, or login</strong>.
            </div>
        </div>

        <div class="typing-indicator" id="typingIndicator">
            <span>ZIMS is thinking</span>
            <span class="dots">
                <span></span><span></span><span></span>
            </span>
        </div>

        <div class="quick-actions">
            <button class="quick-btn" onclick="quickAsk('What events do you have?')">🦁 List Events</button>
            <button class="quick-btn" onclick="quickAsk('What are your opening hours?')">🕐 Hours</button>
            <button class="quick-btn" onclick="quickAsk('What should I bring?')">🎒 What to Bring</button>
            <button class="quick-btn" onclick="quickAsk('What is your cancellation policy?')">❌ Cancellation</button>
            <button class="quick-btn" onclick="quickAsk('Where are you located?')">📍 Location</button>
            <button class="quick-btn" onclick="quickAsk('Help')">📖 Help</button>
        </div>

        <div class="chat-input-area">
            <input type="text" id="chatInput" placeholder="Type your question..." 
                   onkeypress="if(event.key==='Enter') sendMessage();" />
            <button id="sendBtn" onclick="sendMessage();">Send</button>
        </div>
        <div class="back-link">
            <a href="MyOverview.aspx">← Back to System</a>
        </div>
    </div>

    <!-- jQuery (required for AJAX) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">
        function sendMessage() {
            var input = $('#chatInput');
            var message = input.val().trim();
            if (message === '') return;

            var messagesDiv = $('#chatMessages');
            var typingDiv = $('#typingIndicator');
            var btn = $('#sendBtn');

            messagesDiv.append('<div class="message user">' + escapeHtml(message) + '</div>');
            input.val('');
            messagesDiv.scrollTop(messagesDiv[0].scrollHeight);

            btn.prop('disabled', true).text('...');
            typingDiv.css('display', 'flex');
            messagesDiv.scrollTop(messagesDiv[0].scrollHeight);

            $.ajax({
                type: "POST",
                url: "ChatBot.aspx/GetBotResponse",
                data: JSON.stringify({ userMessage: message }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    typingDiv.css('display', 'none');
                    var botReply = response.d;
                    messagesDiv.append('<div class="message bot">' + botReply + '</div>');
                    messagesDiv.scrollTop(messagesDiv[0].scrollHeight);
                    btn.prop('disabled', false).text('Send');
                },
                error: function (xhr, status, error) {
                    typingDiv.css('display', 'none');
                    var errMsg = '⚠️ Oops! Could not reach the server. Please try again.';
                    try {
                        var jsonResp = JSON.parse(xhr.responseText);
                        if (jsonResp.Message) errMsg = '⚠️ ' + jsonResp.Message;
                    } catch (e) { }
                    messagesDiv.append('<div class="message bot">' + errMsg + '</div>');
                    messagesDiv.scrollTop(messagesDiv[0].scrollHeight);
                    btn.prop('disabled', false).text('Send');
                }
            });
        }

        function quickAsk(question) {
            $('#chatInput').val(question);
            sendMessage();
        }

        function escapeHtml(unsafe) {
            return unsafe
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;")
                .replace(/"/g, "&quot;")
                .replace(/'/g, "&#039;");
        }

        $(document).ready(function () {
            $('#chatInput').focus();
        });
    </script>

</body>
</html>