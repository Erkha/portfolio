<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use App\Entity\User;

class UserFixtures extends Fixture
{
    
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
         $this->passwordEncoder = $passwordEncoder;
    }

    public function load(ObjectManager $manager)
    {
         $admin = new User();
         $admin->setUsername('admin')
            ->setRoles(['ROLE_ADMIN'])
             ->setPassword($this->passwordEncoder->encodePassword(
                 $admin,
                 'admin'
             ));

         $manager->persist($admin);

        $manager->flush();
    }
}
