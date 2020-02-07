nx = 50;
ny = 50;

G = zeros(nx*ny);

for i = 1:nx
    for j = 1:nx
        n = j + (i-1)*ny;
        if i==1 || i == nx || j == 1 || j == ny
            G(n,n) = 1;
        else
            nxm = j + (i-2)*ny;
            nxp = j + i*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j + 1 + (i-1)*ny;
            
            G(n,n) = -4;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nyp) = 1;
            G(n,nym) = 1;   
        end
    end
end

[E,D] = eigs(G,9,'SM');

i = 1;
j = 1;

for solution = 1:9
    for loop = 1:2500
        space{solution}(i,j) = E(loop,solution);
        if(j==50)
            j = 1;
            i = i + 1;
        else
            j = j + 1;
        end
    end
    i = 1;
    j = 1;
end

for figureCounter = 1:9
    figure(figureCounter)
    surf(space{figureCounter})
end

