import Foundation

final class OnboardingModel {
    
    private(set) var onboardingDetails = [Onboadring]()
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        onboardingDetails = [
            Onboadring(
                onboardingTitle: OnboardingTitle(
                    title: "Your Personal Assistant",
                    subtitle: "Simplify your life with an AI companion"
                ),
                informationDetails: InformationDetails(
                    backgroundColorView: nil,
                    title: "👋🏻   Introduction ",
                    details: """
    Meet Assist, your personal assistant!
    I am here to help you with a wide range of tasks and inquiries, from setting reminders and making appointments to answering questions and providing recommendations. Developed by a team from Ukraine, I am constantly learning and improving to provide the best possible assistance. Let's get started!
    """,
                    image: nil
                )),
            Onboadring(
                onboardingTitle: OnboardingTitle(
                    title: "Get assistance with any topic",
                    subtitle: "From daily tasks to complex queries, we’ve got you covered"
                ),
                informationDetails: InformationDetails(
                    backgroundColorView: Asset.chatBlue.color,
                    title: "I have a lot of meetings, what should I do?",
                    details: """
Solution ideas:
 1. Prioritize meetings that are most important and reschedule or cancel the rest
 2. Set a time limit for each meeting
 3. Try to combine meetings that have similar topics
 4. Request an agenda before each meeting to ensure it's necessary for you to attend
 5. Try to attend meetings virtually to save time on travel
 6. Delegate someone else to attend the meeting on your behalf if possible
 7. Schedule meetings for specific days and times to avoid interruptions throughout the day
 8. Use meeting time to brainstorm and problem-solve with colleagues to make the most of the time
 9. Use meeting time to build relationships with colleagues and network
 10. Consider alternative communication methods like email or instant messaging for non-urgent matters.
""",
                    image: nil
                )),
            Onboadring(
                onboardingTitle: OnboardingTitle(
                    title: "Perfect copy you can rely on",
                    subtitle: "Generate professional texts effortlessly"
                ),
                informationDetails: InformationDetails(
                    backgroundColorView: Asset.chatPurpul.color,
                    title: "Can you write me a 2000 words on The American Revolution?",
                    details: "The American Revolution, a seminal event in world history, unfolded during the latter half of the 18th century. Known also as the Revolutionary War, this epochal struggle saw thirteen of Great Britain's North American colonies break away from the colonial power to form the United States of decision was met with fierce opposition.",
                    image: nil
                )),
            Onboadring(
                onboardingTitle: OnboardingTitle(
                    title: "Upgrade for Unlimited AI Capabilities",
                    subtitle: "7-Day Free Trial, then $19.99/month, auto-renewable"
                ),
                informationDetails: InformationDetails(
                    backgroundColorView: nil,
                    title: nil,
                    details: nil,
                    image: ImageAsset(name: "illustration4").image
                ))
        ]
    }
    
}
