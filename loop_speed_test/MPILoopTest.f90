program MPILoopTest
  implicit none
  include 'mpif.h'

  integer :: ierr, rank, size
  real(kind=8) :: cpu_start, cpu_end
  real(kind=8), allocatable :: example_array(:)
  integer :: num_cells, i

  num_cells = 1000
  
  print*, 'Size of array for time comparison: ', num_cells
  !read(*,*) num_cells
  
  !! allocate the number of cells
  allocate(example_array(num_cells/2))
  example_array = 0

  !! initialise mpi and determine the rank
  call MPI_INIT(ierr)
  call MPI_COMM_RANK(MPI_COMM_WORLD,rank,ierr)

  !! start our timer
  call CPU_TIME(cpu_start)

  !! perform matrix operation
  if (rank == 1) then
     do i=1, num_cells/2
        example_array(i) = i+1
     enddo
  elseif (rank == 0) then
     do i=1,num_cells/2
        example_array(i) = i+4
     enddo
  endif

  !! end the timer
  call CPU_TIME(cpu_end)

  call MPI_FINALIZE(ierr)

  !! print out the amount of time taken for the process to run
  print*, 'Rank: ', rank,  'Time: ', cpu_end-cpu_start
  !print*, example_array
end program MPILoopTest
