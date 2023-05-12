function YHat = projection(v, B)
% v: column vector to be projected
% B: basis matrix for the subspace, where each column is a basis vector
% YHat: column vector representing the projection of v onto the subspace

% Find the orthogonal projection of v onto each basis vector in B
proj = zeros(size(B));
for i = 1:size(B, 2)
    proj(:, i) = (v' * B(:, i)) / norm(B(:, i))^2 * B(:, i);
end

% Sum the orthogonal projections to get the projection onto the subspace
YHat = sum(proj, 2);
end

