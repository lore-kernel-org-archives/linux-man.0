From: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] close.2: Mention a need of shutdown before closing
 socket
Date: Fri, 7 Oct 2011 13:03:14 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1110071300410.7183@dhcp-27-109.brq.redhat.com>
References: <1314620800-15587-1-git-send-email-lczerner@redhat.com> <CAKgNAkjDZufWp-H7NeSRT40FGBRCkMuisesbGcdJnD94OZucUA@mail.gmail.com> <alpine.LFD.2.00.1110070906440.7183@dhcp-27-109.brq.redhat.com>
 <CAKgNAki_fBFgoOHwsBbhocpzRt3_Zges49mLQwpkHfA+NYcxHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki_fBFgoOHwsBbhocpzRt3_Zges49mLQwpkHfA+NYcxHA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 7 Oct 2011, Michael Kerrisk wrote:

> Hi Lukas
> 
> On Fri, Oct 7, 2011 at 9:09 AM, Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > On Fri, 7 Oct 2011, Michael Kerrisk wrote:
> >
> >> Lukas,
> >>
> >> On Mon, Aug 29, 2011 at 2:26 PM, Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >> > When dealing with sockets, we have to be sure that there is no recv
> >> > still blocking on it on another thread, otherwise it might block forever,
> >> > since no more messages will be send via the socket. We should advice to
> >> > use shutdown before closing socket.
> >>
> >> I'm looking into this now. The picture may be more complex than this.
> >> Tell me, so you have a Solaris system available for testing?
> >>
> >> Thanks,
> >
> > Hi Michael,
> >
> > Thanks for looking into this. Unfortunately I do not have any Solaris system
> > for testing, that was a customer report. His complaint was mainly not because
> > the behaviour on Linux differs, but because this was not documented anywhere.
> 
> Okay. I will see if I can find a test system somewhere. (The system I
> used to use seems to have gone away.)
> 
> Just FYI: I confirmed what you are seeing, but the issue seems more
> general: basically, closing a file descriptor in one thread while
> reading in another thread does not cause the read operation to
> terminate (it will still read data if/when it becomes available).
> 
> By the way, I'm wondering about creating a small repo of test
> programs. I might like to add a modified version of your test program
> to that repo. Can you put that code under a Free License and supply a
> copyright?
> 
> Thanks,
> 
> Michael

Hi Michael,

no problem, here is the program, feel free to update it as you like.
Thanks for looking into this.

-Lukas

---

/**
 * Copyright 2011 (C) Red Hat, Inc., Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it would be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write the Free Software Foundation,
 * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/un.h>
#include <unistd.h>
#include <pthread.h>

#define BUFSIZE 1024

void *close_socket(void *arg) {
	int sockfd = *(int *)arg;

	sleep(3);
	printf("Thread: closing socket %d\n", sockfd);
//	shutdown(sockfd, SHUT_RDWR);
	close(sockfd);
}

int client(void) {
	int sockfd;
	int len;
	struct sockaddr_un address;
	int ret;
	char *buffer=malloc(BUFSIZE);
	pthread_t thread;

	sockfd = socket(AF_UNIX, SOCK_STREAM, 0);

	address.sun_family = AF_UNIX;
	strcpy(address.sun_path, "server_socket");
	len = sizeof(address);

	ret = connect(sockfd, (struct sockaddr *)&address, len);
	if (ret == -1) {
		perror("connect");
		return 1;
	}
	printf("client connected\n");

	ret = pthread_create(&thread, NULL, close_socket, (void *)&sockfd);
	if (ret != 0) {
		perror("Creating thread failed");
		return 1;
	}

	while (1) {
		ret = recv(sockfd,buffer,BUFSIZE,0);
		if (ret < 0) {
			perror("recv");
			return 1;
		}
		printf("Data received: %s\n", buffer);
		sleep(1);
	}

	close(sockfd);
	return 0;
}

int server(void) {
	char *message="This is the message I am sending to you";
	struct sockaddr_un server_addr, client_addr;
	int server_sockfd, client_sockfd;
	int server_len, client_len;
	int ret;

	unlink("server_socket");
	server_sockfd = socket(AF_UNIX, SOCK_STREAM, 0);

	server_addr.sun_family = AF_UNIX;
	strcpy(server_addr.sun_path, "server_socket");
	server_len = sizeof(server_addr);
	bind(server_sockfd, (struct sockaddr *)&server_addr, server_len);

	listen(server_sockfd, 5);

	client_len = sizeof(client_addr);
	client_sockfd = accept(server_sockfd,
		(struct sockaddr *)&client_addr, &client_len);

	printf("Server: sending data...\n");
	ret = send(client_sockfd ,message,strlen(message),0);
	if (ret < 0) {
		perror("send");
		return 1;
	}

	/* simulate running server by not closing the client_socket socket */
	return 0;
}

int main() {
	pid_t pid;
	int n;
	
	pid = fork();
	if (pid < 0) {
		perror("fork failed");
		exit(1);
	}
	if (pid > 0) {
		printf(" - starting server\n");
		server();
		printf(" - exiting server\n");
		wait();
	} else {
		sleep(1);
		printf(" - starting client\n");
		client();
		printf(" - exiting client\n");
	}
}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
