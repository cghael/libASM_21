NAME =			libasm.a

#---------- Compile ----------

NM =			nasm
NM_FLAGS =		-f macho64

CC =			gcc
FLAGS =			-Wall -Wextra -Werror -L. -lasm
HEADERS =		-I$(INC_DIR)

#---------- Includes ----------

INC_LIST =		libasm.h
INC_DIR =		./inc/
INC =			$(addprefix $(INC_DIR), $(INC_LIST))

#*** BONUS ***

B_INC_LIST =	libasm_bonus.h
B_INC =			$(addprefix $(INC_DIR), $(B_INC_LIST))

#---------- Sources ----------

SRC_LIST =		ft_strlen.s \
				ft_strcpy.s \
				ft_write.s \
				ft_read.s \
				ft_strcmp.s \
				ft_strdub.s

SRC_DIR =		./src/
SRC =			$(addprefix $(SRC_DIR), $(SRC_LIST))

#*** BONUS ***

B_SRC_LIST =	ft_list_push_front.s \
				ft_list_size.s \
				ft_list_sort.s \
				ft_list_remove_if.s \
				ft_atoi_base.s

B_SRC_DIR = 	./src_bonus/
B_SRC =			$(addprefix $(B_SRC_DIR), $(B_SRC_LIST))

#---------- Objects ----------

OBJ_DIR =		objects/
OBJ_LIST =		$(patsubst %.s, %.o, $(SRC_LIST))
OBJ	=			$(addprefix $(OBJ_DIR), $(OBJ_LIST))

#*** BONUS ***

B_OBJ_LIST =	$(patsubst %.s, %.o, $(B_SRC_LIST))
B_OBJ =			$(addprefix $(OBJ_DIR), $(B_OBJ_LIST))

#---------- COLORS ----------
GREEN =			\033[0;32m
RED =			\033[0;31m
RESET =			\033[0m

.PHONY:			all clean fclean re

$(NAME):		$(OBJ_DIR) $(OBJ)
				ar rc $(NAME) $(OBJ)
				@ranlib $(NAME)
				@echo "\n$(NAME): $(GREEN)object files were created$(RESET)"
				@echo "$(NAME): $(GREEN)$(NAME) was created$(RESET)"

bonus:			$(OBJ_DIR) $(OBJ) $(B_OBJ)
				ar rc $(NAME) $(OBJ) $(B_OBJ)
				@ranlib $(NAME)
				@echo "\n$(NAME): $(GREEN)object files were created$(RESET)"
				@echo "$(NAME): $(GREEN)$(NAME) was created$(RESET)"

$(OBJ_DIR):
				@mkdir -p $(OBJ_DIR)
				@echo "$(NAME): $(GREEN)$(OBJ_DIR) was created$(RESET)"

$(OBJ_DIR)%.o:	$(SRC_DIR)%.s
				$(NM) $(NM_FLAGS) $< -o $@
				echo "$(GREEN).$(RESET)\c"

$(OBJ_DIR)%.o:	$(B_SRC_DIR)%.s
				$(NM) $(NM_FLAGS) $< -o $@
				echo "$(GREEN).$(RESET)\c"

%.o:			%.c

test:			$(NAME) $(INC)
				$(CC) $(FLAGS) $(HEADERS) -o test main.c

b_test:			$(NAME) $(B_INC) $(INC)
				$(CC) $(FLAGS) $(HEADERS) -o b_test b_main.c

clean:
				@rm -rf $(OBJ_DIR)
				@echo "$(NAME): $(RED)$(OBJ_DIR) was deleted$(RESET)"
				@echo "$(NAME): $(RED)object files were deleted$(RESET)"

fclean:			clean
				@rm -f $(NAME)
				@rm -f test
				@rm -f b_test
				@echo "$(NAME): $(RED)$(NAME) was deleted$(RESET)"

re:
				@$(MAKE) fclean
				@$(MAKE) all