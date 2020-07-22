/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main_bonus.c                                       :+:    :+:            */
/*                                                     +:+                    */
/*   By: greed <greed@student.codam.nl>               +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/07/22 20:01:16 by greed         #+#    #+#                 */
/*   Updated: 2020/07/22 20:16:58 by greed         ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm_bonus.h"

void	ft_list_print(t_list *head)
{
	while (head)
	{
		printf("%s", (char *)head->data);
		head = head->next;
		if (head)
			printf("->");
		else
			printf("\n");
	}
}

static void	test_ft_list_push_front(void)
{
	t_list	*head;

	head = malloc(sizeof(t_list));
	if (!head)
		return ;
	printf("LST_PUSHFRONT\n");
	head->data = "oldhead";
	head->next = NULL;
	ft_list_push_front(&head, "head");
	printf("format: head->elem1\n");
	ft_list_print(head);
	printf("\n");
}

static void	test_ft_list_size(void)
{
	t_list	*head;
	size_t	out;

	head = NULL;
	printf("LST_SIZE\n");
	ft_list_push_front(&head, "list1");
	ft_list_push_front(&head, "list2");
	ft_list_push_front(&head, "list3");
	ft_list_print(head);
	out = ft_list_size(head);
	printf("out: %ld\n\n", out);
}


static void	test_ft_list_remove_if(void)
{
	t_list	*head = NULL;

	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	printf("LIST_REMOVE_IF\n");
	ft_list_print(head);
	ft_list_remove_if(&head, "DELETE_ME", &ft_strcmp);
	ft_list_print(head);
	printf("\n");
}

int		main(void)
{
	printf("\n\e[1;34m\t***\t---\tTESTING BONUS\t---\t***\n\e[0m");
	test_ft_list_push_front();
	test_ft_list_size();
	test_ft_list_remove_if();
	return (0);
}