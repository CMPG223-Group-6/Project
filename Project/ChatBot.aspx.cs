using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.UI;

namespace Project   
{
    public partial class ChatBot : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private static string GetAllEventsList()
        {
            return "🦁 <strong>Our Zoo Events:</strong><br/><br/>" +
                   "1. 🦒 <strong>Safari Tour</strong> – Guided tour through the wildlife safari zone.<br/>" +
                   "2. 🐦 <strong>Bird Show</strong> – Live bird show featuring exotic and rare species.<br/>" +
                   "3. 🌙 <strong>Night Zoo Experience</strong> – After-hours guided tour of nocturnal animals.<br/>" +
                   "4. 🐍 <strong>Reptile Encounter</strong> – Up-close encounter with snakes and reptiles.<br/>" +
                   "5. 🦁 <strong>Big Cat Feeding</strong> – Watch keepers feed lions and tigers.<br/>" +
                   "6. 🐒 <strong>Primate Walk</strong> – Walking tour through the primate enclosures.<br/>" +
                   "7. 🌊 <strong>Marine Life Show</strong> – Interactive show featuring seals and marine animals.<br/>" +
                   "8. 🎬 <strong>Behind the Scenes Tour</strong> – Backstage tour of animal care facilities.<br/>" +
                   "9. 🐑 <strong>Kids Petting Zoo</strong> – Hands-on animal interaction session for children.<br/>" +
                   "10. 🌅 <strong>Sunset Safari</strong> – Evening safari tour to see animals at dusk.<br/><br/>" +
                   "💡 Type any event name above for more details, or ask about <strong>bookings</strong>!";
        }

        private static string GetEventDetails(string userMessageLower)
        {
            var eventMap = new Dictionary<string, string>
            {
                { "sunset safari", "🌅 <strong>Sunset Safari</strong>: Evening safari tour to see animals at dusk." },
                { "safari tour", "🦒 <strong>Safari Tour</strong>: Guided tour through the wildlife safari zone." },
                { "bird show", "🐦 <strong>Bird Show</strong>: Live bird show featuring exotic and rare species." },
                { "night zoo", "🌙 <strong>Night Zoo Experience</strong>: After-hours guided tour of nocturnal animals." },
                { "nocturnal", "🌙 <strong>Night Zoo Experience</strong>: After-hours guided tour of nocturnal animals." },
                { "reptile encounter", "🐍 <strong>Reptile Encounter</strong>: Up-close encounter with snakes and reptiles." },
                { "reptile", "🐍 <strong>Reptile Encounter</strong>: Up-close encounter with snakes and reptiles." },
                { "snake", "🐍 <strong>Reptile Encounter</strong>: Up-close encounter with snakes and reptiles." },
                { "big cat feeding", "🦁 <strong>Big Cat Feeding</strong>: Watch keepers feed lions and tigers." },
                { "big cat", "🦁 <strong>Big Cat Feeding</strong>: Watch keepers feed lions and tigers." },
                { "lion", "🦁 <strong>Big Cat Feeding</strong>: Watch keepers feed lions and tigers." },
                { "tiger", "🦁 <strong>Big Cat Feeding</strong>: Watch keepers feed lions and tigers." },
                { "primate walk", "🐒 <strong>Primate Walk</strong>: Walking tour through the primate enclosures." },
                { "primate", "🐒 <strong>Primate Walk</strong>: Walking tour through the primate enclosures." },
                { "monkey", "🐒 <strong>Primate Walk</strong>: Walking tour through the primate enclosures." },
                { "marine life show", "🌊 <strong>Marine Life Show</strong>: Interactive show featuring seals and marine animals." },
                { "marine", "🌊 <strong>Marine Life Show</strong>: Interactive show featuring seals and marine animals." },
                { "seal", "🌊 <strong>Marine Life Show</strong>: Interactive show featuring seals and marine animals." },
                { "behind the scenes", "🎬 <strong>Behind the Scenes Tour</strong>: Backstage tour of animal care facilities." },
                { "kids petting zoo", "🐑 <strong>Kids Petting Zoo</strong>: Hands-on animal interaction session for children." },
                { "petting zoo", "🐑 <strong>Kids Petting Zoo</strong>: Hands-on animal interaction session for children." },
                { "petting", "🐑 <strong>Kids Petting Zoo</strong>: Hands-on animal interaction session for children." },
                { "kids", "🐑 <strong>Kids Petting Zoo</strong>: Hands-on animal interaction session for children." }
            };

            foreach (var kvp in eventMap)
            {
                if (userMessageLower.Contains(kvp.Key))
                {
                    return kvp.Value;
                }
                    
            }
            return null;
        }

        [WebMethod]
        public static string GetBotResponse(string userMessage)
        {
            if (userMessage == null || userMessage.Trim() == "")
            {
                return "Please type a question!";
            }

            string msg = userMessage.ToLower().Trim();

            if (msg.Contains("checkout") || msg.Contains("check out") || msg.Contains("exit") || msg.Contains("leave") || msg.Contains("depart"))
            {
                return "🚪 <strong>Checkout / Exit Zoo Procedure:</strong><br/><br/>" +
                       "When you are ready to leave the zoo, please follow these steps:<br/><br/>" +
                       "• <strong>Step 1:</strong> Return to the <strong>Main Entrance Office (Gate 1)</strong>.<br/>" +
                       "• <strong>Step 2:</strong> Return any borrowed equipment (e.g., wheelchairs, strollers) at the office.<br/>" +
                       "• <strong>Step 3:</strong> The system will log your <strong>departure time</strong> via the 'Exit Zoo' function.<br/>" +
                       "• <strong>Step 4:</strong> If you have any feedback, please fill out our <strong>visitor survey</strong> at the office.<br/><br/>" +
                       "🕐 Please ensure you exit the zoo before closing time:<br/>" +
                       "• Monday – Thursday: 17:00<br/>" +
                       "• Friday – Sunday: 18:30<br/>" +
                       "• Public Holidays: 16:00<br/><br/>" +
                       "📍 The office is located at <strong>Gate 1, Main Entrance</strong>.";
            }

            if (msg.Contains("check-in") || msg.Contains("check in") || msg.Contains("checking in") ||
                msg.Contains("arrive") || msg.Contains("arrival") || msg.Contains("enter"))
            {
                string eventInfo = GetEventDetails(msg);
                string eventName = string.IsNullOrEmpty(eventInfo) ? "" : eventInfo + "<br/><br/>";

                return eventName +
                       "🏢 <strong>Check-in Procedure – Please Visit the Office:</strong><br/><br/>" +
                       "• <strong>Step 1:</strong> Go to the <strong>Main Entrance Office (Gate 1)</strong> upon arrival.<br/>" +
                       "• <strong>Step 2:</strong> Present your <strong>booking reference code</strong> or <strong>ticket QR code</strong> to the staff.<br/>" +
                       "• <strong>Step 3:</strong> The staff will verify your booking and provide you with <strong>entry wristbands</strong>.<br/>" +
                       "• <strong>Step 4:</strong> You will receive a <strong>map</strong> and <strong>event schedule</strong> for the day.<br/>" +
                       "• <strong>Step 5:</strong> Follow the directional signs to your event meeting point.<br/><br/>" +
                       "⏰ <strong>Important:</strong> Check-in opens <strong>1 hour before</strong> your event start time.<br/>" +
                       "📋 Please bring a valid <strong>ID</strong> for verification.<br/>" +
                       "📍 The office is located at <strong>Gate 1, Main Entrance</strong> – look for the ZIMS signage.";
            }

            if ((msg.Contains("ticket") || msg.Contains("available") || msg.Contains("booked") ||
                 msg.Contains("capacity") || msg.Contains("visit") || msg.Contains("visits") ||
                 msg.Contains("spots") || msg.Contains("space") || msg.Contains("seats")) &&
                (msg.Contains("event") || msg.Contains("tour") || msg.Contains("show") ||
                 msg.Contains("feeding") || msg.Contains("encounter") || msg.Contains("safari")))
            {
                string eventInfo = GetEventDetails(msg);

                if (eventInfo != null)
                {
                    return eventInfo + "<br/><br/>📋 <strong>To check ticket availability and number of visits:</strong><br/>" +
                           "• Please visit the <strong>'Booking'</strong> form in the system.<br/>" +
                           "• An Administrator or Zoo Assistant can check real-time availability.<br/>" +
                           "• The booking system will show you the <strong>number of tickets remaining</strong> and allow you to reserve your spot.<br/>" +
                           "• ⚠️ <strong>Note:</strong> Walk-in availability is not guaranteed – we recommend booking in advance!";
                }
                else
                {
                    return "📋 <strong>To check ticket availability for any event:</strong><br/>" +
                           "• Please use the <strong>'Booking'</strong> form in the ZIMS system.<br/>" +
                           "• An Administrator or Zoo Assistant can check real-time ticket counts.<br/>" +
                           "• The system displays the <strong>number of tickets remaining</strong> for each event.<br/>" +
                           "• 💡 <strong>Tip:</strong> Book early to secure your spot – popular events fill up quickly!";
                }
            }

            if (msg.Contains("what events") || msg.Contains("list events") || msg.Contains("show events") ||
                msg.Contains("all events") || msg.Contains("events available") || msg.Contains("tell me about events") ||
                msg.Contains("what do you have") || msg.Contains("what can i do") || msg.Contains("event list"))
            {
                return GetAllEventsList();
            }

            string specificEvent = GetEventDetails(msg);

            if (specificEvent != null)
            {
                return specificEvent;
            }

            if (msg.Contains("address") || msg.Contains("location") || msg.Contains("where") || msg.Contains("find"))
            {
                return "📍 <strong>Natal Zoological Gardens</strong><br/>" +
                       "Address: 1 Zoo Road, Durban, 4001, South Africa<br/>" +
                       "📞 Phone: 031 785 4708<br/>" +
                       "💬 WhatsApp: 083 267 0392 / 083 640 2641<br/>" +
                       "📧 Email: admin@natalzoo.co.za";
            }

            if (msg.Contains("phone") || msg.Contains("contact") || msg.Contains("call") || msg.Contains("whatsapp") || msg.Contains("email"))
            {
                return "📞 <strong>Contact Us:</strong><br/>" +
                       "• Phone: 031 785 4708<br/>" +
                       "• WhatsApp: 083 267 0392 / 083 640 2641<br/>" +
                       "• Email: admin@natalzoo.co.za<br/>" +
                       "📍 We're located at Natal Zoological Gardens, Durban.";
            }

            if (msg.Contains("hour") || msg.Contains("open") || msg.Contains("close") || msg.Contains("time") || msg.Contains("when"))
            {
                if (msg.Contains("holiday") || msg.Contains("public"))
                {
                    return "📅 <strong>Public Holiday Hours:</strong> 8:00 – 16:00";
                }
                return "🕐 <strong>Zoo Opening Hours:</strong><br/>" +
                       "• Monday – Thursday: 8:00 – 17:00<br/>" +
                       "• Friday – Sunday: 8:00 – 18:30<br/>" +
                       "• Public Holidays: 8:00 – 16:00<br/><br/>" +
                       "⏰ Check-in for events opens 1 hour before your scheduled start time.";
            }

            if (msg.Contains("bring") || msg.Contains("wear") || msg.Contains("pack") || msg.Contains("sunscreen") || msg.Contains("hat") || msg.Contains("camera") || msg.Contains("photography") || msg.Contains("tripod"))
            {
                return "🎒 <strong>What to bring for your visit:</strong><br/>" +
                       "• Comfortable walking shoes<br/>" +
                       "• Sunscreen & a hat<br/>" +
                       "• A water bottle<br/><br/>" +
                       "📸 Photography is welcome in all zones. <strong>Tripods require a special permit</strong> – please enquire at the main gate.";
            }

            if (msg.Contains("food") || msg.Contains("drink") || msg.Contains("eat") || msg.Contains("cafeteria") || msg.Contains("picnic") || msg.Contains("kiosk") || msg.Contains("snack"))
            {
                return "🍔 <strong>Food & Drinks Policy:</strong><br/>" +
                       "• Outside food is allowed in designated picnic areas.<br/>" +
                       "• No food is permitted inside animal enclosures.<br/>" +
                       "• We have <strong>3 cafeterias</strong> and <strong>5 snack kiosks</strong> onsite.<br/><br/>" +
                       "🍦 Enjoy a meal with a view of the wildlife!";
            }

            if (msg.Contains("wheelchair") || msg.Contains("disability") || msg.Contains("mobility") || msg.Contains("access") || msg.Contains("gate 1"))
            {
                return "♿ <strong>Accessibility:</strong><br/>" +
                       "• All our main pathways are wheelchair accessible.<br/>" +
                       "• Wheelchairs are available at the <strong>main entrance (Gate 1)</strong> at <strong>no extra charge</strong>.<br/>" +
                       "• Please notify us in advance if you require special assistance.";
            }

            if (msg.Contains("cancel") || msg.Contains("refund") || msg.Contains("cancellation"))
            {
                return "❌ <strong>Cancellation Policy:</strong><br/>" +
                       "• <strong>Full refund</strong> for cancellations made 48+ hours before the event.<br/>" +
                       "• <strong>50% refund</strong> for cancellations made 24 – 48 hours before.<br/>" +
                       "• <strong>No refund</strong> within 24 hours of the event.<br/><br/>" +
                       "Please contact admin@natalzoo.co.za to cancel your booking.";
            }

            if (msg.Contains("book") || (msg.Contains("event") && (msg.Contains("book") || msg.Contains("reserve"))))
            {
                return "📅 To book an event, a Zoo Assistant or Administrator uses the <strong>'Booking'</strong> feature. You'll need a Tourist ID and an Event Type. Bookings can be added, updated, or cancelled.";
            }
                

            if (msg.Contains("pay") || msg.Contains("payment") || msg.Contains("cost") || msg.Contains("price"))
            {
                return "💰 Payments are processed via the <strong>'Receive Payment'</strong> function. We accept Cash, Card, or Online payments. A unique Transaction ID and receipt are generated.";
            }
                

            if (msg.Contains("report") || msg.Contains("top 5") || msg.Contains("statistics") || msg.Contains("chart"))
            {
                return "📊 Administrators can generate <strong>'Request Reports'</strong> to see the Top 5 Event Types booked within a specific time period. Results are displayed as a chart and table.";
            }
                

            if (msg.Contains("tourist") || msg.Contains("visitor") || msg.Contains("add tourist"))
            {
                return "🧑‍🤝‍🧑 Tourists are managed via <strong>'Maintain Tourists'</strong>. You can Add, Edit, or Delete tourist records including Name, Age, Contact, Email, and Province.";
            }
                

            if (msg.Contains("admin") || msg.Contains("assistant") || msg.Contains("login") || msg.Contains("credentials") || msg.Contains("role"))
            {
                return "🔐 <strong>3 User Types:</strong><br/> • <strong>Admins</strong> – full access.<br/> • <strong>Assistants</strong> – limited access (tourists, bookings, check-ins).<br/> • <strong>Customers</strong> – basic access (check-in, exit, payment).";
            }

            if (msg.Contains("help") || msg.Contains("support") || msg.Contains("faq") || msg.Contains("manual"))
            {
                return "📖 You can ask me about:<br/>" +
                       "• <strong>Zoo Info</strong> (Address, Hours, Contact)<br/>" +
                       "• <strong>Visitors</strong> (What to bring, Food, Accessibility)<br/>" +
                       "• <strong>Events</strong> – try <strong>'What events do you have?'</strong><br/>" +
                       "• <strong>Bookings</strong> (Check-in, Checkout, Cancellation, Ticket Availability)<br/>" +
                       "• <strong>System Features</strong> (Payments, Reports, Tourists)";
            }

            if (msg.Contains("zims") || msg.Contains("system") || msg.Contains("natal") || msg.Contains("zoo"))
            {
                return "🏛️ <strong>ZIMS</strong> (Zoo Information Management System) automates visitor management, bookings, events, payments, and reporting for Natal Zoological Gardens.";
            }
                

            if (msg.Contains("database") || msg.Contains("query") || msg.Contains("performance") || msg.Contains("speed"))
            {
                return "⚡ All database queries process in <strong>under 3 seconds</strong>. The system uses a centralised database.";
            }
                

            if (msg.Contains("language") || msg.Contains("currency") || msg.Contains("international"))
            {
                return "🌍 ZIMS supports <strong>multi-language</strong> and <strong>multiple currencies</strong> for international customers.";
            }

            if (msg.Contains("hello") || msg.Contains("hi") || msg.Contains("hey") || msg.Contains("good morning") || msg.Contains("good day"))
            {
                return "👋 Hello! Welcome to the ZIMS Chatbot. Ask me about zoo hours, events, bookings, or FAQs! Try <strong>'What events do you have?'</strong> to see our full list.";
            }

            else
            {
                return "🤔 Hmm, I'm not sure about that. Try asking me about:<br/>" +
                       "• <strong>Zoo Info</strong> (Address, Hours, Contact)<br/>" +
                       "• <strong>Visitors</strong> (What to bring, Food, Accessibility)<br/>" +
                       "• <strong>Events</strong> – try <strong>'What events do you have?'</strong><br/>" +
                       "• <strong>Bookings</strong> (Check-in, Checkout, Cancellation)<br/>" +
                       "• <strong>System Features</strong> (Payments, Reports, Tourists)";
            }
                
        }
    }
}