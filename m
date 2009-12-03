From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14723] New: Undocumented behaviour of connect() with
 SO_SNDTIMEO
Date: Thu, 3 Dec 2009 10:08:54 GMT
Message-ID: <bug-14723-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14723

           Summary: Undocumented behaviour of connect() with SO_SNDTIMEO
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: rchebotarev-m0ImkXdSVU0@public.gmane.org
        Regression: No


Setting option SO_SNDTIMEO to the socket cause connect() return with
EINPROGRESS errno after timeout, but this nonstandard feature is not described
in man pages of socket(7) and connect(2).

Sample:

int main(int argc, char *argv[])
{
    int sockfd, n;
    struct sockaddr_in serv_addr;

    struct timeval timeout;
    timeout.tv_sec = 4;
    timeout.tv_usec = 0;

    if( (sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
    {
        perror("socket");
        return -1;
    }

    if( setsockopt(sockfd, SOL_SOCKET, SO_SNDTIMEO, &timeout, sizeof(timeout))
== -1 )
    {
        perror("setsockopt");
        return -1;
    }

    bzero (&serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(9999);

    if(inet_pton(AF_INET, argv[1], &serv_addr.sin_addr) < 1)
    {
        printf("Invalid IP address value. Exit.\n");
        return -1;
    }

    if(connect(sockfd, (struct sockaddr*) &serv_addr, sizeof(serv_addr)) < 0)
    {
        printf("errno = %d\n", errno);
        perror("connect()");
        return -1;
    }

    close(sockfd);

    return 0;
}

$ time ./client 88.88.88.88
errno = 115
connect(): Operation now in progress

real    0m4.001s
user    0m0.000s
sys     0m0.000s

# tcpdump -i ppp0 -n port 9999 -ttt
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ppp0, link-type LINUX_SLL (Linux cooked), capture size 96 bytes
000000 IP 81.25.50.166.47087 > 88.88.88.88.9999: S 3574453598:3574453598(0) win
5840 <mss 1460,sackOK,timestamp 207409345 0,nop,wscale 6>
2. 997721 IP 81.25.50.166.47087 > 88.88.88.88.9999: S 3574453598:3574453598(0)
win 5840 <mss 1460,sackOK,timestamp 207410245 0,nop,wscale 6>

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
