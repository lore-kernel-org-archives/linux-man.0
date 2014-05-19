From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] inotify.7: add example
Date: Mon, 19 May 2014 08:15:09 +0200
Message-ID: <5379A16D.3070609@gmail.com>
References: <1400429918-6824-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400429918-6824-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, John McCutchan <john-jueV0HHMeujJJrXXpGQQMAC/G2K4zDHf@public.gmane.org>, Robert Love <rlove-L7G0xEPcOZbYtjvyW6yDsg@public.gmane.org>, Eric Paris <eparis-FjpueFixGhCM4zKIHC2jIg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

Thank you for proposing this. A few comments below.
Could you integrate and resubmit, please.

On 05/18/2014 06:18 PM, Heinrich Schuchardt wrote:
> An example for the usage of the inotify API is provided.
> 
> It shows the usage of inotify_init1(2),inotify_add_watch(2) as well as

s/form/from/

> polling and reading form the inotify file descriptor.

> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/inotify.7 | 226 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 226 insertions(+)
> 
> diff --git a/man7/inotify.7 b/man7/inotify.7
> index 8e848b2..a422eda 100644
> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -752,6 +752,232 @@ if the older had not yet been read)
>  instead checked if the most recent event could be coalesced with the
>  .I oldest
>  unread event.
> +.SH EXAMPLE
> +The following program demonstrates the usage of the inotify API.
> +It marks the directories passed as a command-line argument

s/a command-line argument/command-line arguments/

> +and waits for events of type
> +.BR IN_OPEN ,
> +.BR IN_CLOSE_NOWRITE 
> +and
> +.BR IN_CLOSE_WRITE .
> +.PP
> +The following output was recorded while editing the file
> +.I /home/user/temp/foo
> +and listing directory
> +.IR /tmp .
> +Before the file and the directory were opened,
> +.B IN_OPEN
> +events occurred.
> +After the file was closed, an
> +.B IN_CLOSE_WRITE
> +event occurred.
> +After the directory was closed, an
> +.B IN_CLOSE_NOWRITE
> +event occurred.
> +Execution of the program ended when the user pressed the ENTER key.
> +.SS Example output
> +.in +4n
> +.nf
> +$ ./inotify.7.example /tmp /home/user/temp
> +Press enter key to terminate.
> +Listening for events.
> +IN_OPEN: /home/user/temp/foo [file]
> +IN_CLOSE_WRITE: /home/user/temp/foo [file]
> +IN_OPEN: /tmp/ [directory]
> +IN_CLOSE_NOWRITE: /tmp/ [directory]
> +
> +Listening for events stopped.
> +.fi
> +.in
> +.SS Program source
> +.nf
> +#include <errno.h>
> +#include <malloc.h>

<malloc.h> is not needed.

> +#include <poll.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/inotify.h>
> +#include <unistd.h>
> +
> +/* Macros for looping over inotify events. */
> +
> +#define EVENT_LEN ( sizeof (struct inotify_event) )
> +#define EVENT_OK(event, len) \\
> +	((long)(len) >= (long)EVENT_LEN && \\
> +	 (long)(len) >= (long)EVENT_LEN + (long)(event)\->len)
> +#define EVENT_NEXT(event, len) \\
> +	((len) \-= EVENT_LEN + (event)\->len, \\
> +	 (struct inotify_event*)(((char *)(event)) + \\
> +	 (event)\->len))

I'm not so keen on these macros, for a number of reasons:

* Why the casts to 'long'?

* EVENT_LEN() just obscures things. Why not just use
  sizeof(struct inotify_event) ?

* EVENT_OK() is possibly useful (but broken, see next point),
  inasmuch as it provides a sanity check that kernel developers
  didn't do something silly, such as returning a partial buffer.
  On the other hand, such a breakage would I think be detected
  fairly quickly, so I'm not too convinced about the need for
  the checks in this macro. Perhaps Robert and John have 
  comments, if they are listening.

* EVENT_LEN() (and EVENT_OK()) are broken. 'len' in the
  structures returned by inotify reads is not the same as
  'event_len' in the structures returned by fanotify reads.
  In particular, for inotify, the offset to the next event is:

        sizeof(struct inotify_event) + event->len;

  And that form seems much more readable to me than adding a
  macro to do the same thing.

  (I was able to fairly quickly find breakages when I tested 
  the program, because of this problem.)
  
> +/* Read all available inotify events from the file descriptor 'fd'
> +   wd is the table of watch descriptors for the directories in argv
> +   argc is the length of wd and argv
> +   argv is the list of watched directories
> +   Entry 0 of wd and argv is unused. */
> +
> +void

s/void/static void/

> +handle_events(int fd, int *wd, int argc, char* argv[])
> +{
> +    const struct inotify_event *event;
> +    char buf[4096];
> +    int i;
> +    ssize_t len;
> +
> +    /* Loop while events can be read from inotify file descriptor. */
> +
> +    for(;;) {
> +
> +        /* Read some events. */
> +
> +        len = read(fd, (void *) &buf, sizeof(buf));
> +        if (len == \-1 && errno != EAGAIN) {
> +            perror("read");
> +            exit(EXIT_FAILURE);
> +        }
> +
> +        /* Check if end of available data reached. */

I think here it might not hurt to have a comment noting that
this catches also the EAGAIN case.

> +
> +        if (len <= 0)
> +            break;
> +
> +        /* Point to the first event in the buffer. */
> +
> +        event = (struct inotify_event *) buf;
> +
> +        /* Loop over all events in the buffer. */
> +
> +        while(EVENT_OK(event, len)) {
> +
> +            /* Print event type. */
> +
> +            if (event\->mask & IN_OPEN)
> +                printf("IN_OPEN: ");
> +            if (event\->mask & IN_CLOSE_NOWRITE)
> +                printf("IN_CLOSE_NOWRITE: ");
> +            if (event\->mask & IN_CLOSE_WRITE)
> +                printf("IN_CLOSE_WRITE: ");
> +
> +            /* Print the name of the watched directory. */
> +
> +            for(i = 1; i < argc; ++i) {
> +                if(wd[i] == event\->wd)
> +                    printf("%s/", argv[i]);
> +            }
> +
> +            /* Print the name of the file. */
> +
> +            if (event\->len)
> +                printf("%s", event\->name);
> +
> +            /* Print type of file system object. */

s/file system/filesystem/

> +
> +            if (event\->mask & IN_ISDIR)
> +                printf(" [directory]\\n");
> +            else
> +                printf(" [file]\\n");
> +
> +            event = EVENT_NEXT(event, len);
> +        }
> +    }
> +}
> +
> +int
> +main(int argc, char* argv[])
> +{
> +    char buf;
> +    int fd, i, poll_num;
> +    int *wd = NULL;

Initializing wd here is unneeded.

> +    nfds_t nfds;
> +    struct pollfd fds[2];
> +
> +    if (argc < 2) {
> +        printf("Usage: %s DIRECTORY [DIRECTORY ...]\\n", argv[0]);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    printf("Press enter key to terminate.\\n");
> +
> +    /* Create the file descriptor for accessing the inotify API. */
> +
> +    fd = inotify_init1(IN_NONBLOCK);
> +    if (fd == \-1) {
> +        perror("inotify_init1");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /* Allocate memory for watch descriptors. */
> +
> +    wd = (int *) calloc(argc, sizeof(int));
> +    if (wd == NULL) {
> +        perror("calloc");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /* Mark directories for events
> +       \- file was opened
> +       \- file was closed */
> +
> +    for (i = 1; i < argc; i++) {
> +        wd[i] = inotify_add_watch(fd, argv[i],
> +                                  IN_OPEN | IN_CLOSE);
> +        if (wd[i] == \-1) {
> +            perror("inotify_add_watch");
> +            exit(EXIT_FAILURE);
> +        }
> +    }
> +
> +    /* Prepare for polling. */
> +
> +    nfds = 2;
> +
> +    /* Console input. */
> +
> +    fds[0].fd = STDIN_FILENO;
> +    fds[0].events = POLLIN;
> +
> +    /* Inotify input. */
> +
> +    fds[1].fd = fd;
> +    fds[1].events = POLLIN;
> +
> +    /* This is the loop to wait for incoming events. */
> +
> +    printf("Listening for events.\\n");
> +    while (1) {
> +        poll_num = poll(fds, nfds, \-1);
> +        if (poll_num == \-1) {
> +            if (errno == EINTR)
> +                continue;
> +            perror("poll");
> +            exit(EXIT_FAILURE);
> +        }
> +        if (poll_num > 0) {
> +
> +            if (fds[0].revents & POLLIN) {
> +
> +                /* Console input is available. Empty stdin and quit. */
> +
> +                while (read(STDIN_FILENO, &buf, 1) > 0 && buf != '\\n')
> +                    continue;
> +                break;
> +            }
> +            if (fds[1].revents & POLLIN) {
> +
> +                /* Inotify events are available. */
> +                handle_events(fd, wd, argc, argv);
> +            }
> +        }
> +    }
> +
> +    /* Close inotify file descriptor. */
> +
> +    close(fd);
> +    free(wd);
> +    printf("Listening for events stopped.\\n");
> +    return EXIT_SUCCESS;

I prefer "exit(...)" (it's the idiom used in most (all?)) man-pages example
code).

> +}
> +.fi
>  .SH SEE ALSO
>  .BR inotifywait (1),
>  .BR inotifywatch (1),

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
