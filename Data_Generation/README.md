## Change the way of down sample:

`        y1[i, :, :, 0] = yy[::2, ::2]
        
        y2[i, :, :, 0] = y1[i, ::2, ::2, 0]
        
        y3[i, :, :, 0] = y2[i, ::2, ::2, 0]
        
        y4[i, :, :, 0] = y3[i, ::2, ::2, 0]
        
        y5[i, :, :, 0] = y4[i, ::2, ::2, 0]
        
        y6[i, :, :, 0] = y5[i, ::2, ::2, 0]`
        
to

`        y1[i, :, :, 0] = cv2.pyrDown(yy)
        
        y2[i, :, :, 0] = cv2.pyrDown(y1[i, :, :, 0])
        
        y3[i, :, :, 0] = cv2.pyrDown(y2[i, :, :, 0])
        
        y4[i, :, :, 0] = cv2.pyrDown(y3[i, :, :, 0])
        
        y5[i, :, :, 0] = cv2.pyrDown(y4[i, :, :, 0])
        
        y6[i, :, :, 0] = cv2.pyrDown(y5[i, :, :, 0])`
