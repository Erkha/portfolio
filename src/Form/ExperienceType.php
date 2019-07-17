<?php

namespace App\Form;

use App\Entity\Experience;
use App\Entity\Skill;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use FOS\CKEditorBundle\Form\Type\CKEditorType;

class ExperienceType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('startDate', DateType::class, [
                'label' => 'Début',
                'widget' => 'single_text',
                'html5'  => true
            ])
            ->add('endDate', DateType::class, [
                'label' => 'Fin',
                'widget' => 'single_text',
                'html5'  => true,
                'required'=> false
            ])
            ->add('title')
            ->add('company')
            ->add('type', ChoiceType::class, [
                'choices'  => Experience::XP_TYPE,
                ])
            ->add('description', CKEditorType::class)
            ->add('skills', EntityType::class, [
        'class' => Skill::class,
        'choice_label' => 'name',
        'expanded'=> true,
        'multiple' => true
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Experience::class,
        ]);
    }
}
