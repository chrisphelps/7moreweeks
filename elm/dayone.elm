-- Elm day one exercises
-- 7 More languages in 7 weeks

-- easy

product list = \
  case list of \
    [] -> 1 \
    head::tail -> head * product tail

xs list = \
  case list of \
    [] -> [] \
    head :: tail -> head.x :: xs tail


address = { street1 = "123 Main St", city = "Longmont", state = "CO", zip = 80503 }
person = { first = "John", last = "Smith", age = 2000, address = address }


-- medium

multiply a b = a * b

(multiply 6) 8

partial = multiply 6

partial 8


filterbyage list = \
  case list of \
    [] -> [] \
    head :: tail -> if head.age > 16 then \
        head :: filterbyage tail \
      else \
        filterbyage tail


-- age will need to be a Maybe - Just age or Nothing
filterbymaybeage list = \
  case list of \
    [] -> [] \
    head :: tail -> \
      case head.age of \
        Just a -> if a > 16 then \
            head :: filterbymaybeage tail \
          else \
            filterbymaybeage tail \
        Nothing -> filterbymaybeage tail

addage {name} = { name = name,  age = Nothing }
fixage person = { person | age = Just person.age }









