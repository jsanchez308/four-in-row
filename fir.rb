# PROYECTOOOOOO         JOHAN SANCHEZ   

=begin
						ALGORITHM

The game begins
	Create the matrix 
		WHILE !winner
				Print the matrix 
				Player 1 
					Position verification
					Victory verification 
						Vertical 
						Hotizontal 
						Diagonal 
							Up
							Down
				Tie verification 
				Print the matrix
				Player 2 
					Position verification 
					Victory verification 	
						Vertical 
						Horizontal 
						Diagonal 
				Tie verification
=end

require "colorize"

def create_matrix(b)
	for i in 0..5
		a=[]
		for j in 0..5
			a[j]= "-"
		end
		b[i]=a
	end 
end

def print_matrix(a)
	for i in 0..a.length-1 
		for j in 0..a.length-1
			print a[i][j]
		end
		puts " "
	end
	puts "123456 <--columnas".cyan
end

def play(a,t) ##ESTE FUE MI PRIMER INTENTO 
	valid=false 
	while(!valid)
		puts "En que columana quereis jugar?"
		j=gets.chomp.to_i
		j=j-1
		if (j<a.length)
			i=5
			while (i>=0) 
				if (a[i][j]==" ")
					a[i][j]=t 
					valid=true
				else
					i=i-1 
				end
			end
			puts "COLUMNA LLENA!!! escoge otra".red
		else
			puts "COLUMNA INVALIDA!!! debes escoger entre 1 y 6. Mira el tablero!".red
		end
	end
end

def play2(a,t) ## EEEEEXITO!
	valid=false
	while(!valid)
		puts "En que columna quieres jugar FICHA #{t}  ???"
		j=gets.chomp.to_i-1
		if (j<a.length && j>=0)
			i=5
			while (i>=0)
				if (a[i][j]=="-")
					a[i][j]=t
					valid=true
					i=i-100
				else
					i=i-1
					if (i==-1)
						puts "------------------------------------------------".cyan
						puts"COLUMNA #{j+1} LLENA!!! escoge otra".red
						print_matrix(a)
						i=-100
					end
				end
			end
		elsif (j==-1)
			puts "--------------------------------------------------------------".cyan
			puts "SOLO LE DISTE ENTER o PUSISTE CERO!!! Escoge una columna, jugador #{t}!".red
			print_matrix(a)		
		else
			puts "--------------------------------------------------------------".cyan
			puts "COMUNA INVALIDA!!! debes escoger entre 1 y 6. Mira el tablero!".red
			print_matrix(a)
		end
	end
	return a
end




def verification_h(a,t)
	for i in 0..a.length-1
		c=0
		j=0
		while (j<a.length)
			if (a[i][j]==t)
				c=c+1
				j=j+1
			else
				j=j+1
				c=0
			end
			if (c==4)
				return true
			end
		end
	end
	return false
end

def verification_v(a,t)
	for j in 0..a.length-1
		c=0
		i=0
		while (i<a.length)
			if (a[i][j]==t)
				c=c+1
				i=i+1
			else
				i=i+1
				c=0
			end
			if (c==4)
				return true
			end
		end
	end
	return false
end

def verification_d_down(a,t) ###ESTE FUE EXITOSO AL QUINTO INTENTO, NO QUISE GUARDAR LAS VERSIONES ANTERIORES... AMEN A LOS AUXILIARES!
	for i in 0..a.length-1
		aux=i
		for j in 0..a.length-1
			c=0
			while (i<a.length && j<a.length && i>=0 && j>=0)
				if (a[i][j]==t)
					c=c+1
					j=j+1
					i=i+1
				else
					j=j+1
					i=i+1
					c=0
				end
				if(c==4)
					i=-100
					return true
				end
			end
			i=aux
		end
	end
	return false
end



def verification_d_up(a,t)
	for i in 0..a.length-1
		aux=i
		for j in 0..a.length-1
			c=0
			while (i<a.length && j<a.length && i>=0 && j>=0 )
				if (a[i][j]==t)
					c=c+1
					j=j+1
					i=i-1
				else
					j=j+1
					i=i-1
					c=0
				end
				if(c==4)
					i=-100
					return true
				end
			end
			i=aux
		end
	end
	return false
end


def tie_verification(a)
	for i in 0..a.length-1
		for j in 0..a.length-1
			if (a[i][j]=="-")
				return true
			end
		end
	end
	return false
end

def game_begins(a, j1,j2)
	puts "-------------------------------------------------------".cyan
	puts "BIENVENIDO A 4 EN LINEA".blue
	create_matrix (a)
	j=j1
	valid=false 
	while (!valid)
		print_matrix(a)
		play2(a,j)
		puts"---------------------------------------------------".cyan
		if (verification_h(a,j) || verification_v(a,j) || verification_d_up(a,j) || verification_d_down(a,j) )
			puts "GANA EL JUGADOR CON LA FICHA #{j}".blue
			valid=true
		end
		if (tie_verification(a)==false)
			puts "EMPATE".blue
			valid=true
		end
		if (j==j1)
			j=j2
		else
			j=j1
		end
	end
	print_matrix(a)
end

f=[]
x="X".light_blue
o="0".magenta
game_begins(f,x,o)