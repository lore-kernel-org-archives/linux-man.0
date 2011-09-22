From: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] close.2: Mention a need of shutdown before closing
 socket
Date: Thu, 22 Sep 2011 11:36:29 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1109221136190.4968@dhcp-27-109.brq.redhat.com>
References: <1314620800-15587-1-git-send-email-lczerner@redhat.com> <CAKgNAkj_+h9njO6ffVg_1ckpBLdyHM=6iZyyU1jpL5sY6Zrs2Q@mail.gmail.com> <alpine.LFD.2.00.1109121215310.3888@dhcp-27-109.brq.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1109121215310.3888-D5fXUWdM4RC5eBp5B7zZTR/sF2h8X+2i0E9HWUfgJXw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 12 Sep 2011, Lukas Czerner wrote:

> On Sat, 10 Sep 2011, Michael Kerrisk wrote:
> 
> > Hi Lukas,
> > 
> > On Mon, Aug 29, 2011 at 2:26 PM, Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > > When dealing with sockets, we have to be sure that there is no recv
> > > still blocking on it on another thread, otherwise it might block forever,
> > > since no more messages will be send via the socket. We should advice to
> > > use shutdown before closing socket.
> > 
> > As far as I know, in the usual case, a simple close() is sufficient.
> > Can you say some more about how you determined the above statement and
> > in what circumstances it applies?
> > 
> > Thanks,
> > 
> > Michael
> 
> Simply calling close() is not sufficient if the recv, or read is
> blocking on another thread. That is because the recv or read will not be
> notified that the descriptor has been closed. This can only be done via
> shutdown.
> 
> We actually have an customer complaining about this behaviour being
> different than on Solaris where simple close() is sufficient to kill
> recv() or read() on another thread. It is simple the way it is in Linux,
> but it should at least be documented.
> 
> I am not sure how to describe the problem more, so I have written really
> simple (and stupid) example, where shutdown should be used.
> 
> Thanks!
> -Lukas

ping

> 
> 
> #include <sys/types.h>
> #include <sys/socket.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/un.h>
> #include <unistd.h>
> #include <pthread.h>
> 
> #define BUFSIZE 1024
> 
> void *close_socket(void *arg) {
> 	int sockfd = *(int *)arg;
> 
> 	sleep(3);
> 	printf("Thread: closing socket %d\n", sockfd);
> 
> /*
>  * Shutdown should be used before close, otherwise the recv() in
>  * client() will block forever.
>  */
> 
> /*	shutdown(sockfd, SHUT_RDWR); */
> 	close(sockfd);
> }
> 
> int client(void) {
> 	int sockfd;
> 	int len;
> 	struct sockaddr_un address;
> 	int ret;
> 	char *buffer=malloc(BUFSIZE);
> 	pthread_t thread;
> 
> 	sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
> 
> 	address.sun_family = AF_UNIX;
> 	strcpy(address.sun_path, "server_socket");
> 	len = sizeof(address);
> 
> 	ret = connect(sockfd, (struct sockaddr *)&address, len);
> 	if (ret == -1) {
> 		perror("connect");
> 		return 1;
> 	}
> 	printf("client connected\n");
> 
> 	ret = pthread_create(&thread, NULL, close_socket, (void *)&sockfd);
> 	if (ret != 0) {
> 		perror("Creating thread failed");
> 		return 1;
> 	}
> 
> 	while (1) {
> 		ret = recv(sockfd,buffer,BUFSIZE,0);
> 		if (ret < 0) {
> 			perror("recv");
> 			return 1;
> 		}
> 		printf("Data received: %s\n", buffer);
> 		sleep(1);
> 	}
> 
> 	close(sockfd);
> 	return 0;
> }
> 
> int server(void) {
> 	char *message="This is the message I am sending to you";
> 	struct sockaddr_un server_addr, client_addr;
> 	int server_sockfd, client_sockfd;
> 	int server_len, client_len;
> 	int ret;
> 
> 	unlink("server_socket");
> 	server_sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
> 
> 	server_addr.sun_family = AF_UNIX;
> 	strcpy(server_addr.sun_path, "server_socket");
> 	server_len = sizeof(server_addr);
> 	bind(server_sockfd, (struct sockaddr *)&server_addr, server_len);
> 
> 	listen(server_sockfd, 5);
> 
> 	client_len = sizeof(client_addr);
> 	client_sockfd = accept(server_sockfd,
> 		(struct sockaddr *)&client_addr, &client_len);
> 
> 	printf("Server: sending data...\n");
> 	ret = send(client_sockfd ,message,strlen(message),0);
> 	if (ret < 0) {
> 		perror("send");
> 		return 1;
> 	}
> 
> 	/* simulate running server by not closing the client_socket socket */
> 	return 0;
> }
> 
> int main() {
> 	pid_t pid;
> 	int n;
> 	
> 	pid = fork();
> 	if (pid < 0) {
> 		perror("fork failed");
> 		exit(1);
> 	}
> 	if (pid > 0) {
> 		printf(" - starting server\n");
> 		server();
> 		printf(" - exiting server\n");
> 		wait();
> 	} else {
> 		sleep(1);
> 		printf(" - starting client\n");
> 		client();
> 		printf(" - exiting client\n");
> 	}
> }
> 

-- 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
