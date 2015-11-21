classdef MaterialDatabase < handle
    properties
        FilePath
        MaterialRawArray
        MaterialList
    end
        
    methods
        %class constructor%
        function obj = MaterialDatabase(filepath)
            obj.FilePath=filepath;
        end
        
        function  LoadMaterials(obj)
            fid = fopen(obj.FilePath,'r');
            obj.MaterialRawArray = textscan(fid,'%d %s %s %d %d %f','headerlines',1, 'Delimiter',',');
            fclose(fid);
            numMaterials=size(obj.MaterialRawArray{1},1);
            n=1;
            
            while n <= numMaterials
                partnumber= obj.MaterialRawArray{1,2}(n,1);
                desc= obj.MaterialRawArray{1,3}(n,1);
                qty= obj.MaterialRawArray{1,4}(n,1);
                lead= obj.MaterialRawArray{1,5}(n,1);
                cost= obj.MaterialRawArray{1,6}(n,1);
                obj.MaterialList{n}=Material(partnumber,desc,qty,lead,cost);
                n=n+1;
            end
                
        end
        
    end
end