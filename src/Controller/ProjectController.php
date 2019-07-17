<?php

namespace App\Controller;

use App\Entity\Project;
use App\Entity\PFile;
use App\Form\ProjectType;
use App\Repository\ProjectRepository;
use App\Repository\PFileRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Entity;

/**
 * @Route("/admin/project")
 */
class ProjectController extends AbstractController
{
    /**
     * @Route("/", name="project_index", methods={"GET"})
     */
    public function index(ProjectRepository $projectRepository): Response
    {
        return $this->render('project/index.html.twig', [
            'projects' => $projectRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="project_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $project = new Project();
        $form = $this->createForm(ProjectType::class, $project);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $project->setUser($this->getUser());
            $entityManager->persist($project);
            $entityManager->flush();

            return $this->redirectToRoute('project_index');
        }

        return $this->render('project/new.html.twig', [
            'project' => $project,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="project_show", methods={"GET"})
     */
    public function show(Project $project): Response
    {
        return $this->render('project/show.html.twig', [
            'project' => $project,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="project_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Project $project): Response
    {
        $form = $this->createForm(ProjectType::class, $project);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('project_index');
        }

        return $this->render('project/edit.html.twig', [
            'project' => $project,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="project_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Project $project): Response
    {
        if ($this->isCsrfTokenValid('delete'.$project->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($project);
            $entityManager->flush();
        }

        return $this->redirectToRoute('project_index');
    }

    /**
     * @Route("/picture_add/{picture_id}/{project_id}", name="add_picture", methods={"GET","POST"})
     * @Entity("project", expr="repository.find(project_id)")
     * @Entity("pFile", expr="repository.find(picture_id)")
     */
    public function addPictureByProject(
        ProjectRepository $projectRepo,
        Request $request,
        PFile $pFile,
        Project $project
    ): Response {
        $project->addPicture($pFile);
        $this->getDoctrine()->getManager()->flush();
        return $this->redirectToRoute('project_pictures', [
                'id' => $project->getId() ]);
    }

    /**
     * @Route("/picture_remove/{picture_id}/{project_id}", name="remove_picture", methods={"GET","POST"})
     * @Entity("project", expr="repository.find(project_id)")
     * @Entity("pFile", expr="repository.find(picture_id)")
     */
    public function removePictureByProject(
        ProjectRepository $projectRepo,
        Request $request,
        PFile $pFile,
        Project $project
    ): Response {
        $project->removePicture($pFile);
        $this->getDoctrine()->getManager()->flush();
        return $this->redirectToRoute('project_pictures', [
                'id' => $project->getId() ]);
    }

    /**

     * @Route("/pictures/{id}", name="project_pictures", methods={"GET","POST"})
     */
    public function indexPicturesByProject(PFileRepository $pFileRepo, Project $project): Response
    {
        return $this->render('/project/picturesByProject.html.twig', [
                'pictures' => $pFileRepo->findAll(),
                'project' => $project
        ]);
    }
}
