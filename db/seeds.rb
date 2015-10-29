User.delete_all
Puzzle.delete_all
Answer.delete_all
Keyword.delete_all

#puzzles
p1 = Puzzle.create(text: 'What is always approaching but never arrives?', category: 'word')
p2 = Puzzle.create(text: 'Which word in the dictionary is spelled incorrectly?', category: 'word')
p3 = Puzzle.create(text: 'What gets broken without being held?', category: 'word')
p4 = Puzzle.create(text: 'What can travel around the world while staying in a corner?', category: 'word')
p5 = Puzzle.create(text: 'Who makes it, has no need for it. Who buys it, has no use for it. Who uses it can neither see nor feel it. What is it?', category: 'word')
p6 = Puzzle.create(text: 'Tear one off and scratch my head, what was red is black instead.', category: 'word')
p7 = Puzzle.create(text: 'Brothers and sisters I have none but this man’s father is my father’s son.
Who is the man?', category: 'logic')
p8 = Puzzle.create(text: 'Your last good ping pong ball fell down into a narrow metal pipe imbedded in concrete one foot deep. How can you get it out undamaged, if all the tools you have are your tennis paddle, your shoe laces and your plastic water bottle, which does not fit into the pipe?', category: 'logic')

#keywords associated with above puzzles
Keyword.create(text: 'tomorrow', puzzle_id: p1.id)
Keyword.create(text: 'incorrectly', puzzle_id: p2.id)
Keyword.create(text: 'promise', puzzle_id: p3.id)
Keyword.create(text: 'stamp', puzzle_id: p4.id)
Keyword.create(text: 'coffin', puzzle_id: p5.id)
Keyword.create(text: 'match', puzzle_id: p6.id)
Keyword.create(text: 'my', puzzle_id: p7.id)
Keyword.create(text: 'son', puzzle_id: p7.id)
Keyword.create(text: 'fill', puzzle_id: p8.id)
Keyword.create(text: 'pipe', puzzle_id: p8.id)
Keyword.create(text: 'water', puzzle_id: p8.id)

#seeding users
u1 = User.create(email: 'katie@test.com', password: '1234', is_admin: true)
u2 = User.create(email: 'john@ga.com', password: '1234', is_admin: false)
u3 = User.create(email: 'sally@ga.com', password: '1234', is_admin: false)
u4 = User.create(email: 'bob@ga.com', password: '1234', is_admin: false)
u5 = User.create(email: 'billy@ga.com', password: '1234', is_admin: false)

#seeding 'user-generated' answers
a1 = Answer.create(text: 'A train', user_id: u2.id, puzzle_id: p1.id, accepted: false)
a2 = Answer.create(text: "I can't figure it out", user_id: u3.id, puzzle_id: p2.id, accepted: false)
a3 = Answer.create(text: 'Water', user_id: u1.id, puzzle_id: p3.id, accepted: false)
a4 = Answer.create(text: 'A driver', user_id: u4.id, puzzle_id: p4.id, accepted: false)
a5 = Answer.create(text: 'Air', user_id: u5.id, puzzle_id: p5.id, accepted: false)
a6 = Answer.create(text: 'Watermelon', user_id: u3.id, puzzle_id: p6.id, accepted: false)
a7 = Answer.create(text: 'My father', user_id: u5.id, puzzle_id: p7.id, accepted: false)
a8 = Answer.create(text: 'Use the shoelace to fish out the ball', user_id: u2.id, puzzle_id: p8.id, accepted: false)

a1_1 = Answer.create(text: 'The answer is tomorrow', user_id: u2.id, puzzle_id: p1.id, accepted: true)
a2_1 = Answer.create(text: 'Incorrectly', user_id: u2.id, puzzle_id: p2.id, accepted: true)
a3_1 = Answer.create(text: 'A promise', user_id: u1.id, puzzle_id: p3.id, accepted: true)
a4_1 = Answer.create(text: 'A stamp', user_id: u3.id, puzzle_id: p4.id, accepted: true)
a5_1 = Answer.create(text: 'A coffin', user_id: u4.id, puzzle_id: p5.id, accepted: true)
a6_1 = Answer.create(text: 'A match', user_id: u5.id, puzzle_id: p6.id, accepted: true)
a7_1 = Answer.create(text: 'My son', user_id: u1.id, puzzle_id: p7.id, accepted: true)
a8_1 = Answer.create(text: 'Fill the pipe with water', user_id: u2.id, puzzle_id: p8.id, accepted: true)
