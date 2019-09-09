program HelloWorld
  ! use statement declares that we will be using the openMP library
  use OMP_LIB

  !$OMP PARALLEL
  
     print*,"Hello from process: ", OMP_GET_THREAD_NUM()
  !$OMP END PARALLEL
  
  
end program HelloWorld
