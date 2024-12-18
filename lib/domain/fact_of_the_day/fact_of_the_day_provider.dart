import 'dart:math';

class StressFacts {
  final List<String> _facts = [
    "Stress is a normal physiological response to challenging situations.",
    "Everyone experiences stress; it's a universal human experience.",
    "Short-term stress can actually boost immune system function.",
    "Chronic stress, however, can have negative health impacts.",
    "Deep breathing exercises can reduce stress in just a few minutes.",
    "Regular exercise is one of the most effective stress-reduction techniques.",
    "Mindfulness meditation can lower cortisol, a stress hormone.",
    "Spending time in nature has been shown to lower stress levels.",
    "Laughter really is good medicine - it reduces stress hormones.",
    "Social support from friends and family can buffer against stress.",
    "Pets can help reduce stress and anxiety in their owners.",
    "A balanced diet can help your body better cope with stress.",
    "Adequate sleep is crucial for managing stress levels.",
    "Caffeine can exacerbate stress and anxiety in some people.",
    "Practicing gratitude has been linked to lower stress levels.",
    "Yoga combines physical activity and mindfulness for stress relief.",
    "Progressive muscle relaxation can help reduce physical tension from stress.",
    "Listening to calming music can lower blood pressure and reduce stress.",
    "Aromatherapy, particularly lavender scent, may help reduce stress.",
    "Talking about your stress with others can help alleviate it.",
    "Journaling can be an effective stress management technique.",
    "Time management skills can help reduce stress from overwhelming schedules.",
    "Setting realistic goals can prevent unnecessary stress.",
    "Learning to say 'no' can prevent overcommitment and reduce stress.",
    "Cognitive behavioral therapy (CBT) is effective for managing stress.",
    "Stress is not a sign of weakness, but a sign that you care.",
    "Men and women may experience and express stress differently.",
    "Stress can be motivating in small doses, helping us meet challenges.",
    "Chronic stress can contribute to heart disease and other health issues.",
    "Recognizing your stress triggers is the first step in managing them.",
    "Hobbies and leisure activities can be great stress relievers.",
    "Volunteering can reduce stress by shifting focus to helping others.",
    "Decluttering your space can help declutter your mind and reduce stress.",
    "Financial planning and budgeting can help alleviate money-related stress.",
    "Positive self-talk can help manage stress and boost self-esteem.",
    "Stress management is a skill that can be learned and improved over time.",
    "Acupuncture has been shown to help some people manage stress.",
    "Massage therapy can help reduce muscle tension caused by stress.",
    "Art therapy can be an effective stress management technique.",
    "Dancing can combine exercise and social interaction for stress relief.",
    "Gardening can be a calming activity that reduces stress.",
    "Stress affects people of all ages, including children and elderly.",
    "Chronic stress can impact memory and cognitive function.",
    "Stress is not always bad - it can help us perform better in certain situations.",
    "Adaptogens are herbs that may help the body resist physical and mental stress.",
    "Regular health check-ups can help manage stress-related health issues.",
    "Stress can manifest in physical symptoms like headaches or stomach issues.",
    "Mindful eating can help reduce stress-related overeating.",
    "Creating a sleep routine can improve sleep quality and reduce stress.",
    "Reducing screen time, especially before bed, can lower stress levels.",
    "Stress is not a personal failure, but a common human experience.",
    "Seeking help for stress is a sign of strength, not weakness.",
    "Workplace stress is common and can be addressed through various strategies.",
    "Perfectionism can increase stress levels; embracing 'good enough' can help.",
    "Chronic stress can affect the immune system, making you more susceptible to illness.",
    "Stress can be contagious; surrounding yourself with calm people can help.",
    "Cold water therapy, like cold showers, may help reduce stress levels.",
    "Chewing gum has been linked to reduced stress and increased alertness.",
    "Reading for pleasure can be a great way to relax and reduce stress.",
    "Creating art, even if you're not an artist, can be a stress-relieving activity.",
    "Listening to nature sounds can have a calming effect on the nervous system.",
    "Practicing forgiveness can reduce stress from holding onto grudges.",
    "Setting boundaries in relationships can help reduce interpersonal stress.",
    "Stress can sometimes be a symptom of an underlying health condition.",
    "Laughing yoga combines voluntary laughter with yogic breathing for stress relief.",
    "Stress balls or fidget toys can provide a physical outlet for stress.",
    "Talking openly about stress helps normalize the experience for others.",
    "Stress management techniques are personal; what works for one may not work for all.",
    "Chronic stress can impact digestive health and gut bacteria balance.",
    "Staying hydrated can help your body better cope with stress.",
    "Practicing mindfulness in daily activities can reduce overall stress levels.",
    "Stress is not a character flaw, but a natural response to life's challenges.",
    "Scheduling 'worry time' can help contain and manage stress and anxiety.",
    "Visualization techniques can help reduce stress and anxiety.",
    "Engaging in creative activities can be a form of stress relief.",
    "Stress can affect sleep quality, creating a cycle of stress and poor sleep.",
    "Regular stretching can help relieve physical tension from stress.",
    "Participating in team sports can combine exercise and social support for stress relief.",
    "Writing a to-do list before bed can help alleviate stress about upcoming tasks.",
    "Chronic stress can impact fertility and reproductive health.",
    "Practicing self-compassion can help manage stress and negative self-talk.",
    "Stress is not always visible; someone may be struggling even if they seem fine.",
    "Spending time with pets has been shown to lower blood pressure and reduce stress.",
    "Engaging in random acts of kindness can boost mood and reduce stress.",
    "Taking regular breaks during work can help manage stress levels.",
    "Stress can sometimes manifest as anger or irritability.",
    "Acknowledging and naming your emotions can help in managing stress.",
    "Chronic stress can contribute to premature aging of cells.",
    "Practicing good posture can help reduce physical stress on the body.",
    "Reducing news consumption can help manage stress from world events.",
    "Chronic stress can impact decision-making abilities.",
    "Talking about stress openly can encourage others to seek help when needed.",
    "Stress management is an important part of overall health and wellness.",
    "Engaging in spiritual or religious practices can help some people manage stress.",
    "Stress is not a competition; everyone's experience is valid.",
    "Learning new skills can boost confidence and reduce stress in challenging situations.",
    "Chronic stress can affect skin health, potentially exacerbating conditions like acne.",
    "Celebrating small victories can help manage stress from larger, ongoing challenges.",
    "Chronic stress can impact weight, either through stress eating or loss of appetite.",
    "Remember, it's okay to not be okay sometimes; seeking help for stress is important.",
  ];

  String getRandomFact() {
    final random = Random();
    return _facts[random.nextInt(_facts.length)];
  }
}
