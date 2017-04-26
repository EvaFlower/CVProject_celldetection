# CVProject_celldetection
  In this project, I achieved to detect hemopoietic cell by using multi-radius ring filter. The hough transformation is very sensitive to the selected radius and needs a good edge detection so it did bad job for detection of hemopoietic cell. I track cells by detecting frame-by-frame and regard circle at most closest position as the same cell.

Test:
I. Run SHOW1 to get figure 3; Run SHOW2 to get figure 4 
II. Set up the file path of file ‘input’ corresponding with current file path of file ‘input’ in the first line of show3. Run show3 to get figure 5
III. Figure 3 needs step-by-step setting up for it is a process of ring filter algorithm implementation and I didn’t write it down the process to get it
