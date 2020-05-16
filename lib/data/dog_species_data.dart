import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/section_controller/section_tab_label.dart';
import '../components/page/page.dart';
import '../model/model.dart';

const BookData dogSpeciesData = BookData(
  title: 'Dog Species',
  subtitle: 'Custom CAL App',
  credit: 'Created by Zoey Child',
  sections: [
    SectionData(
      title: 'Introduction',
      color: Colors.red,
      label: SectionTabLabel(
        iconData: Icons.home,
        label: 'Home',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Introduction'),
          PageParagraph(
              text:
                  'This is a computer-assisted learning activity created to help familiarise you with different breeds of dog.'),
          PageParagraph(
              text:
                  'By the end of this activity, you will have read a little about every breed recognised by the Kennel Club and seen some accompanying pictures. You shouldn\'t aim to immediately memorise all the information provided here; focus on the most common breeds and refer back to this activity in the future for more specific information on lesser-known breeds.'),
          PageParagraph(
              text:
                  'Dog breeds can be divided into seven broad categories based on what purpose they were originally bred for. Each section in this activity will give some background information on a breed category and then list the dogs included in it.'),
        ]),
        PageData(content: [
          PageTitle(text: 'Contents'),
          Hyperlink(
            section: 1,
            child: ContentsItem(
              indent: 1,
              style: ContentsItemStyle.large,
              child: Text('Hounds'),
            ),
          ),
          ContentsItem(indent: 2, child: Text('Greyhound')),
          ContentsItem(indent: 2, child: Text('Dachshund')),
          Hyperlink(
            section: 2,
            child: ContentsItem(
                indent: 1,
                style: ContentsItemStyle.large,
                child: Text('Working')),
          ),
          ContentsItem(indent: 2, child: Text('Dobermann')),
          ContentsItem(indent: 2, child: Text('Great Dane')),
          Hyperlink(
            section: 3,
            child: ContentsItem(
                indent: 1,
                style: ContentsItemStyle.large,
                child: Text('Terrier')),
          ),
          ContentsItem(indent: 2, child: Text('Scottish Terrier')),
          ContentsItem(indent: 2, child: Text('Jack Russel Terrier')),
          Hyperlink(
            section: 4,
            child: ContentsItem(
              indent: 1,
              style: ContentsItemStyle.large,
              child: Text('Gundog'),
            ),
          ),
          ContentsItem(indent: 2, child: Text('Labrador Retriever')),
          ContentsItem(indent: 2, child: Text('Cocker Spaniel')),
          Hyperlink(
            section: 5,
            child: ContentsItem(
                indent: 1,
                style: ContentsItemStyle.large,
                child: Text('Pastoral')),
          ),
          ContentsItem(indent: 2, child: Text('Border Collie')),
          ContentsItem(indent: 2, child: Text('Samoyed')),
          Hyperlink(
            section: 6,
            child: ContentsItem(
                indent: 1,
                style: ContentsItemStyle.large,
                child: Text('Utility')),
          ),
          ContentsItem(indent: 2, child: Text('Bulldog')),
          ContentsItem(indent: 2, child: Text('Poodle')),
          Hyperlink(
            section: 7,
            child: ContentsItem(
                indent: 1, style: ContentsItemStyle.large, child: Text('Toy')),
          ),
          ContentsItem(indent: 2, child: Text('Cavalier King Charles Spaniel')),
          ContentsItem(indent: 2, child: Text('Pug')),
        ]),
      ],
    ),
    SectionData(
      title: 'Hounds',
      color: Colors.orange,
      label: SectionTabLabel(
        iconData: FontAwesomeIcons.tachometerAlt,
        label: 'Hound',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Hounds'),
          PageParagraph(
              text:
                  'Hounds were originally bred to hunt. They are divided into sighthounds and scent hounds based on whether they hunt with sight and speed, or scent and endurance.'),
          PageParagraph(
              text:
                  'Common hounds include Beagles, Dachshunds, Greyhounds, and Whippets.'),
          PageTitle(text: 'Greyhound'),
          PageParagraph(
              text:
                  'Greyhounds were bred originally for hare coursing so have very long legs and a slim build to help them run fast (up to 40 mph) and corner sharply. Greyhound racing was introduced to the United States and United Kingdom in the 1920s.'),
          LocalImage(location: 'greyhound.jpg'),
          PageParagraph(
              text:
                  'They have short fur and come in a wide variety of colours.'),
          LocalImage(location: 'greyhound_racing.jpg'),
        ]),
        PageData(content: [
          PageTitle(text: 'Dachshund'),
          PageParagraph(
              text:
                  'Dachshunds have short legs and long bodies, bred to flush badgers and other burrowing animals out of their burrows. The miniature variety was used similarly to hunt rabbits and mice. Dachshunds have three coat varieties: smooth, wirehaired, and longhaired.'),
          LocalImage(location: 'dachshund_long.jpg'),
          PageParagraph(
              text:
                  'The normal size Dachshund is 20 to 22 cm tall. They have a life expectancy of around 12-16 years.'),
          PageParagraph(
              text:
                  'Although their name comes from German, modern Germans call this dog the Dackel or Teckel.'),
          LocalImage(location: 'dachshund_wire.jpg'),
          LocalImage(
            location: 'dachshund_how_will_it_end.jpg',
            height: 600,
          ),
        ]),
      ],
    ),
    SectionData(
      title: 'Working',
      color: Colors.yellow,
      label: SectionTabLabel(
        iconData: FontAwesomeIcons.briefcase,
        label: 'Working',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Working'),
          PageParagraph(
              text:
                  'Working dogs were bred as guard dogs, or for search and rescue. Familiar working dog breeds are the Dobermann, Newfoundland, and Great Dane.'),
          PageTitle(text: 'Dobermann'),
          PageParagraph(
              text:
                  'The Dobermann was created by Karl Friedrich Louis Dobermann, a German tax collector, to protect him while collecting in dangerous areas. Dobermanns were used by the United States during World War II, and work as guard dogs or personal protection dogs.'),
          LocalImage(location: 'dobermann.jpg'),
          PageParagraph(
              text:
                  'Dobermanns come in four colours: black, blue, red, and fawn.'),
          LocalImage(location: 'dobermann_colours.jpg'),
          LocalImage(
            location: 'dobermann_puppies.jpg',
            height: 600,
          ),
        ]),
        PageData(content: [
          PageTitle(text: 'Great Dane'),
          PageParagraph(
              text:
                  'The Great Dane is a German breed originally created for hunting bears, boar, and deer. Both the tallest dog ever recorded and the tallest living dog are Great Danes.'),
          LocalImage(location: 'greatdane.jpg'),
          LocalImage(location: 'greatdane_ears.jpg'),
        ]),
      ],
    ),
    SectionData(
      title: 'Terrier',
      color: Colors.green,
      label: SectionTabLabel(
        iconData: FontAwesomeIcons.utensilSpoon,
        label: 'Terrier',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Terrier'),
          PageParagraph(
              text:
                  'Terriers were originally bred to hunt vermin both above and below ground. Every terrier has "terrier" at the end of its name! (Not every dog with "terrier" is a terrier though...)'),
          PageTitle(text: 'Scottish Terrier'),
          PageParagraph(
              text:
                  'The Scottish Terrier originates in Scotland as part of a group of highland terriers called the Skye Terriers. They were bred to hunt and fight badgers but throughout their history have been a popular pet breed.'),
          PageParagraph(
              text:
                  'They have a wiry outer coat covering a soft, dense undercoat. Their coats vary in colour from black through to white.'),
          LocalImage(location: 'scottie_colours.jpg'),
          PageParagraph(
              text:
                  'When the board game Monopoly was created, Scotties were among the most popular pets in the United States leading to their inclusion in the game as a player piece.'),
          LocalImage(location: 'scottie_monopoly.jpg'),
        ]),
        PageData(content: [
          PageTitle(text: 'Jack Russel Terrier'),
          PageParagraph(
              text:
                  'Jack Russel Terriers were bred originally for the sport of fox hunting. They were intended to be aggressive enough to chase the fox without injuring it.'),
          LocalImage(location: 'jackrussel_playing.jpg'),
          PageParagraph(
              text:
                  'Since World War II, demand for fox hunting and therefore Jack Russels reduced. Since then, they have been used increasingly as companion dogs.'),
          PageParagraph(
              text:
                  'Their coats are predominantly white, with black, brown, or tan markings. They are either smooth-coated, rough-coated, or a combination of the two known as broken-coated.'),
          LocalImage(location: 'jackrussel_colours.jpg'),
        ]),
      ],
    ),
    SectionData(
      title: 'Gundog',
      color: Colors.lightBlue,
      label: SectionTabLabel(
        iconData: FontAwesomeIcons.dove,
        label: 'Gundog',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Gundog'),
          PageParagraph(
              text:
                  'These were bred to help with shooting; either by finding live game or by retrieving shot and wounded animals.'),
          PageTitle(text: 'Labrador Retriever'),
          PageParagraph(
              text:
                  'The Labrador Retriever is often called the most popular dog breed in the world. They make up 60-70% of guide dogs in the United States and are still sometimes used as working dogs to retrieve shot game as they were originally bred to do.'),
          LocalImage(location: 'labrador.jpg'),
          PageParagraph(
              text:
                  'Labradors are recognised as having three colours: black, yellow, and chocolate. They have a short, dense coat that is water-resistant.'),
          LocalImage(location: 'labrador_colours.jpg'),
        ]),
        PageData(content: [
          PageTitle(text: 'Cocker Spaniel'),
          PageParagraph(
              text:
                  'Cocker Spaniels developed in the United Kingdom as a breed used for hunting the Eurasian woodcock. They are still used in the UK for hunting but are more often seen as pets.'),
          LocalImage(location: 'cocker.jpg'),
          PageParagraph(
              text:
                  'Modern Cocker Spaniels are the second most popular dog breed in the UK, beaten only by the Labrador Their coats come in a variety of colours including black, red, and gold. '),
          LocalImage(location: 'cocker_puppy.jpg'),
        ]),
      ],
    ),
    SectionData(
      title: 'Pastoral',
      color: Colors.blue,
      label: SectionTabLabel(
        iconData: FontAwesomeIcons.tractor,
        label: 'Pastoral',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Pastoral'),
          PageParagraph(
              text:
                  'Pastoral dogs were bred to herd animals including sheep, cattle, and reindeer.'),
          PageTitle(text: 'Border Collie'),
          PageParagraph(
              text:
                  'The Border Collie was bred for herding sheep and cattle, and it\'s still often used for that today.'),
          PageParagraph(
              text:
                  'They have a usually thick double coat. While usually black and white in colour, they can be found in most colours and patterns seen in dogs.'),
          LocalImage(location: 'collie_smooth.jpg'),
          LocalImage(location: 'collie_tricolour.jpg'),
        ]),
        PageData(content: [
          PageTitle(text: 'Samoyed'),
          LocalImage(location: 'samoyed.jpg'),
          PageParagraph(
              text:
                  'The Samoyed was bred to hunt, herd reindeer, and haul sledges.'),
          LocalImage(location: 'samoyed_running.jpg'),
          PageParagraph(
              text:
                  'A distinguishing feature of the breed is the tail which curls up and is held touching its back. They have a dense, white, double-layered coat.'),
        ]),
      ],
    ),
    SectionData(
      title: 'Utility',
      color: Colors.purple,
      label: SectionTabLabel(
        iconData: FontAwesomeIcons.wrench,
        label: 'Utility',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Utility'),
          PageParagraph(
              text:
                  'The utility group contains breeds bred for a purpose not included in any of the other groups.'),
          PageTitle(text: 'Bulldog'),
          PageParagraph(
              text:
                  'Bulldogs were originally used in bull baiting but since its outlawing in 1835 they have become popular pets, and are considered by some to be a national symbol of the United Kingdom.'),
          LocalImage(location: 'bulldog.jpg'),
          PageParagraph(
              text:
                  'They have wide heads and shoulders and a protruding lower jaw. Their coats are short and can be anywhere from white to red.'),
          LocalImage(location: 'bulldog_face.jpg'),
        ]),
        PageData(content: [
          PageTitle(text: 'Poodle'),
          PageParagraph(
              text:
                  'Poodles have three size variants: standard, miniature, and toy. The standard size is thought of as the original; the others were bred down to be smaller.'),
          PageParagraph(
              text:
                  'They have a dense, curly coat that is unusual among dogs for being only a single coat rather than the usual double coat. The hairs grow continuously and curl around, requiring clipping to prevent matting. A wide array of clipping patterns are seen, varying by the work a poodle is used for or for fashion.'),
          LocalImage(location: 'poodle.jpg'),
          LocalImage(location: 'poodle_toy.jpg'),
        ]),
      ],
    ),
    SectionData(
      title: 'Toy',
      color: Colors.pink,
      label: SectionTabLabel(
        iconData: FontAwesomeIcons.shapes,
        label: 'Toy',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Toy'),
          PageParagraph(text: 'Toy breeds were bred as companion or lap dogs.'),
          PageTitle(text: 'Cavalier King Charles Spaniel'),
          PageParagraph(
              text:
                  'The Cavalier King Charles Spaniel emerged from the King Charles Spaniel as an attempt to re-create how the breed looked in paintings of King Charles II. The breed is small for a spaniel and was kept as a lap dog.'),
          LocalImage(location: 'cavalier.jpg'),
          PageParagraph(
              text:
                  'The breed has four recognised colours: Blenheim (white with chestnut markings), Black and Tan (black with tan highlights), Ruby (chestnut all over), and Tricolor (black and white with tan markings).'),
          LocalImage(location: 'cavalier_face.jpg'),
        ]),
        PageData(content: [
          PageTitle(text: 'Pug'),
          PageParagraph(
              text:
                  'Pugs originate from China where they were kept as companion dogs. The line of pugs bred in the United Kingdom following their original import from China had longer legs and noses than modern pugs, but were replaced by a new wave of imports in 1860.'),
          PageParagraph(
              text:
                  'Their coats can be fawn, apricot fawn, silver fawn, or black.'),
          LocalImage(location: 'pug.jpg'),
        ]),
      ],
    ),
  ],
);
