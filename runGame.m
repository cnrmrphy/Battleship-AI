function runGame(handles, imageChange, Strat1MoveRowArray,Strat1MoveColArray, Strat1HitMissArray,Strat2MoveRowArray,Strat2MoveColArray, Strat2HitMissArray,Strat3MoveRowArray,Strat3MoveColArray, Strat3HitMissArray, Strat4MoveRowArray,Strat4MoveColArray, Strat4HitMissArray,Strat5MoveRowArray,Strat5MoveColArray, Strat5HitMissArray)

shipCount1=17;
shipCount2=17;
shipCount3=17;
shipCount4=17;
shipCount5=17;

imageChange1=imageChange;
imageChange2=imageChange;
imageChange3=imageChange;
imageChange4=imageChange;
imageChange5=imageChange;

handles.strat1Counter.String=0;
handles.strat2Counter.String=0;
handles.strat3Counter.String=0;
handles.strat4Counter.String=0;
handles.strat5Counter.String=0;

    for n=1:100   
        
            if Strat1HitMissArray(n)==1
                Row=Strat1MoveRowArray(n);
                Col=Strat1MoveColArray(n);
                imageChange1(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=255;
                imageChange1(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange1(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=0;
               shipCount1=shipCount1-1;
            elseif Strat1HitMissArray(n)==0 && shipCount1>0
                Row=Strat1MoveRowArray(n);
                Col=Strat1MoveColArray(n);
                imageChange1(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=0;
                imageChange1(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange1(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=255;
            end
            
        if shipCount2 > 0
            if Strat2HitMissArray(n)==1
                Row=Strat2MoveRowArray(n);
                Col=Strat2MoveColArray(n);
                imageChange2(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=255;
                imageChange2(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange2(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=0;
                shipCount2=shipCount2-1;
            elseif Strat2HitMissArray(n)==0 && shipCount2>0
                Row=Strat2MoveRowArray(n);
                Col=Strat2MoveColArray(n);
                imageChange2(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=0;
                imageChange2(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange2(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=255;
            end
        end
             
            if Strat3HitMissArray(n)==1
                Row=Strat3MoveRowArray(n);
                Col=Strat3MoveColArray(n);
                imageChange3(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=255;
                imageChange3(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange3(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=0;
               shipCount3=shipCount3-1;
            elseif Strat3HitMissArray(n)==0 && shipCount3>0
                Row=Strat3MoveRowArray(n);
                Col=Strat3MoveColArray(n);
                imageChange3(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=0;
                imageChange3(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange3(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=255;
            end
             
            if Strat4HitMissArray(n)==1
                Row=Strat4MoveRowArray(n);
                Col=Strat4MoveColArray(n);
                imageChange4(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=255;
                imageChange4(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange4(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=0;
               shipCount4=shipCount4-1;
            elseif Strat4HitMissArray(n)==0 && shipCount4>0
                Row=Strat4MoveRowArray(n);
                Col=Strat4MoveColArray(n);
                imageChange4(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=0;
                imageChange4(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange4(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=255;
            end
              
            if Strat5HitMissArray(n)==1
                Row=Strat5MoveRowArray(n);
                Col=Strat5MoveColArray(n);
                imageChange5(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=255;
                imageChange5(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange5(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=0;
               shipCount5=shipCount5-1;
            elseif Strat5HitMissArray(n)==0 && shipCount5>0
                Row=Strat5MoveRowArray(n);
                Col=Strat5MoveColArray(n);
                imageChange5(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,1)=0;
                imageChange5(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,2)=0;
                imageChange5(((Row)*50)-(47):(Row*50)-1,(Col)*50-(47):(Col*50)-1,3)=255;
            end
            
            imshow(imageChange1, 'InitialMagnification', 'fit', 'Parent', handles.strat1Display )
            imshow(imageChange2, 'InitialMagnification', 'fit', 'Parent', handles.strat2Display )
            imshow(imageChange3, 'InitialMagnification', 'fit', 'Parent', handles.strat3Display )
            imshow(imageChange4, 'InitialMagnification', 'fit', 'Parent', handles.strat4Display )
            imshow(imageChange5, 'InitialMagnification', 'fit', 'Parent', handles.strat5Display )
       
        if shipCount1>0
            handles.strat1Counter.String=num2str(n+1);
        end
        if shipCount2>0
            handles.strat2Counter.String=num2str(n+1);
        end
        if shipCount3>0
            handles.strat3Counter.String=num2str(n+1);
        end
        if shipCount4>0
            handles.strat4Counter.String=num2str(n+1);
        end
        
        if shipCount5>0
            handles.strat5Counter.String=num2str(n+1);
        end
        
            pause(0.05)
      
    end