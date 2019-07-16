<?php

namespace App\Controller;

use App\Entity\PFile;
use App\Form\PFileType;
use App\Repository\PFileRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\File;

/**
 * @Route("/admin/file")
 */
class PFileController extends AbstractController
{
    /**
     * @Route("/", name="file_index", methods={"GET"})
     */
    public function index(PFileRepository $fileRepository): Response
    {
        return $this->render('file/index.html.twig', [
            'files' => $fileRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="file_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $file = new PFile();
        $form = $this->createForm(PFileType::class, $file);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /** @var UploadedFile $brochureFile */
            $pFile = $form['pFile']->getData();

            if ($pFile) {
                $originalFilename = pathinfo($pFile->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = transliterator_transliterate('Any-Latin; Latin-ASCII; [^A-Za-z0-9_] remove; Lower()', $originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$pFile->guessExtension();

                $pFile->move(
                    $this->getParameter('brochures_directory'),
                    $newFilename
                );

                $file->setFilename($newFilename);
            }
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($file);
            $entityManager->flush();

            return $this->redirectToRoute('file_index');
        }

        return $this->render('file/new.html.twig', [
            'file' => $file,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="file_show", methods={"GET"})
     */
    public function show(PFile $file): Response
    {
        return $this->render('file/show.html.twig', [
            'file' => $file,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="file_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, PFile $file): Response
    {
        $file->setFilename(
            new File($this->getParameter('brochures_directory').'/'.$file->getFilename())
        );
        $form = $this->createForm(PFileType::class, $file);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /** @var UploadedFile $brochureFile */
            $pFile = $form['pFile']->getData();

            if ($pFile) {
                $originalFilename = pathinfo($pFile->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = transliterator_transliterate('Any-Latin; Latin-ASCII; [^A-Za-z0-9_] remove; Lower()', $originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$pFile->guessExtension();

                $pFile->move(
                    $this->getParameter('brochures_directory'),
                    $newFilename
                );

                $file->setFilename($newFilename);
            }
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('file_index');
        }

        return $this->render('file/edit.html.twig', [
            'file' => $file,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="file_delete", methods={"DELETE"})
     */
    public function delete(Request $request, PFile $file): Response
    {
        if ($this->isCsrfTokenValid('delete'.$file->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($file);
            $entityManager->flush();
        }

        return $this->redirectToRoute('file_index');
    }
}
