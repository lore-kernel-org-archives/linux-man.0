From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] exit.3: ATTRIBUTES: Note function that is not thread-safe
Date: Mon, 20 May 2013 10:30:29 +0800
Message-ID: <51998AC5.3070803@cn.fujitsu.com>
References: <1367572694-21931-1-git-send-email-penght@cn.fujitsu.com> <5197C8C4.3060205@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000605020100040309030206"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5197C8C4.3060205-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------000605020100040309030206
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1


On 05/19/2013 02:30 AM, Michael Kerrisk wrote:
> 
> Ouch! Really? so one cannot call exit(3) from a multithreaded program?
> This seems a clear violation of the standard. 
> 

Yes.
I make a test program to test exit(3) which is not thread-safe.

$ gcc -o exit exit.c -lpthread
$ ./exit
Goodbye.
...
Goodbye.
Segmentation fault

> Could you provide some pointers to more information on this point (e.g., URL
> of mail thread archive discussions.)
> 

http://sourceware.org/ml/libc-alpha/2013-03/msg00004.html


-- 
Best Regards,
Peng

> Thanks,
> 
> Michael
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


--------------000605020100040309030206
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8;
 name="exit.c"
Content-Disposition: attachment;
 filename="exit.c"

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

long long int i = 0;

static void bye (void)
{
	printf ("Goodbye.\n");
}

void *thread_severity()
{
	while (1) {
		atexit(bye);
		i++;
		if ( i >= 1000000) {
			printf("i is enough.\n");
			return NULL;
		}
	}

	return NULL;
}

int main (void)
{
	pthread_t thread_severity_id, thread_fmtmsg_id;

	pthread_create(&thread_fmtmsg_id, NULL, thread_severity, NULL);

	while(1) {
		if (i >= 500000)
			exit(0);
		usleep(1000);
	}
}


--------------000605020100040309030206--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
