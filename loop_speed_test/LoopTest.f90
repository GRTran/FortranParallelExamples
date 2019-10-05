program LoopTest
  use OMP_LIB
  implicit none

  !! declare variables used in the loop tester
  integer :: number_iterations
  integer :: count
  
  real(kind=8) :: cpu_start
  real(kind=8) :: cpu_end

  real(kind=8) :: x
  !! - - - - - - - - - - - - - - - - - - - - -
  write(*,fmt='(a25)',advance='no') 'Enter number within loop: '
  read(*,*) number_iterations
  
  call CPU_TIME(cpu_start)
  !$OMP PARALLEL
  
  do count=1, number_iterations
     x = x*5.
  enddo

  !$OMP END PARALLEL
  call CPU_TIME(cpu_end)
  print*,'Parallel execution time: ', cpu_end-cpu_start

  call CPU_TIME(cpu_start)
  do count=1, number_iterations
     x = x*5.
  enddo
  call CPU_TIME(cpu_end)
  print*,'Serial execution time: ', cpu_end-cpu_start
  
end program  
