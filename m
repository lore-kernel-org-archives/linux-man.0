From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] vsock.7: document VSOCK socket address family
Date: Mon, 11 Dec 2017 20:32:35 +0100
Message-ID: <9641cb22-765f-7202-7f4f-420fadf2189c@gmail.com>
References: <20171205105618.30049-1-stefanha@redhat.com>
 <19A05993-CB7C-4A7F-8ECF-CE55B1EE9619@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19A05993-CB7C-4A7F-8ECF-CE55B1EE9619-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jorgen S. Hansen" <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dexuan Cui <decui-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/06/2017 03:06 PM, Jorgen S. Hansen wrote:
> 
>> On Dec 5, 2017, at 11:56 AM, Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>
>> The AF_VSOCK address family has been available since Linux 3.9 without a
>> corresponding man page.
>>
>> This patch adds vsock.7 and describes its use along the same lines as
>> existing ip.7, unix.7, and netlink.7 man pages.
>>
>> CC: Jorgen Hansen <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
>> CC: Dexuan Cui <decui-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
>> Signed-off-by: Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> man7/vsock.7 | 180 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 180 insertions(+)
>> create mode 100644 man7/vsock.7
>>
>> diff --git a/man7/vsock.7 b/man7/vsock.7
>> new file mode 100644
>> index 000000000..46dc561f5
>> --- /dev/null
>> +++ b/man7/vsock.7
>> @@ -0,0 +1,180 @@
>> +.TH VSOCK 7 2017-11-30 "Linux" "Linux Programmer's Manual"
>> +.SH NAME
>> +vsock \- Linux VSOCK address family
>> +.SH SYNOPSIS
>> +.B #include <sys/socket.h>
>> +.br
>> +.B #include <linux/vm_sockets.h>
>> +.PP
>> +.IB stream_socket " = socket(AF_VSOCK, SOCK_STREAM, 0);"
>> +.br
>> +.IB datagram_socket " = socket(AF_VSOCK, SOCK_DGRAM, 0);"
>> +.SH DESCRIPTION
>> +The VSOCK address family facilitates communication between virtual machines and
>> +the host they are running on.  This address family is used by guest agents and
>> +hypervisor services that need a communications channel that is independent of
>> +virtual machine network configuration.
>> +.PP
>> +Valid socket types are
>> +.B SOCK_STREAM
>> +and
>> +.BR SOCK_DGRAM .
>> +.B SOCK_STREAM
>> +provides connection-oriented byte streams with guaranteed, in-order delivery.
>> +.B SOCK_DGRAM
>> +provides a connectionless datagram packet service with best-effort delivery and
>> +best-effort ordering.  Availability of these socket types is dependent on the
>> +underlying hypervisor.
>> +.PP
>> +A new socket is created with
>> +.PP
>> +    socket(AF_VSOCK, socket_type, 0);
>> +.PP
>> +When a process wants to establish a connection it calls
>> +.BR connect (2)
>> +with a given destination socket address.  The socket is automatically bound to
>> +a free port if unbound.
>> +.PP
>> +A process can listen for incoming connections by first binding to a socket
>> +address using
>> +.BR bind (2)
>> +and then calling
>> +.BR listen (2).
>> +.PP
>> +Data is transferred using the usual
>> +.BR send (2)
>> +and
>> +.BR recv (2)
>> +family of socket system calls.
>> +.SS Address format
>> +A socket address is defined as a combination of a 32-bit Context Identifier
>> +(CID) and a 32-bit port number.  The CID identifies the source or destination,
>> +which is either a virtual machine or the host.  The port number differentiates
>> +between multiple services running on a single machine.
>> +.PP
>> +.in +4n
>> +.EX
>> +struct sockaddr_vm {
>> +    sa_family_t     svm_family;     /* address family: AF_VSOCK */
>> +    unsigned short  svm_reserved1;
>> +    unsigned int    svm_port;       /* port in native byte order */
>> +    unsigned int    svm_cid;        /* address in native byte order */
>> +};
>> +.EE
>> +.in
>> +.PP
>> +.I svm_family
>> +is always set to
>> +.BR AF_VSOCK .
>> +.I svm_reserved1
>> +is always set to 0.
>> +.I svm_port
>> +contains the port in native byte order.
>> +The port numbers below 1024 are called
>> +.IR "privileged ports" .
>> +Only a process with
>> +.B CAP_NET_BIND_SERVER
>> +capability may
>> +.BR bind (2)
>> +to these port numbers.
>> +.PP
>> +There are several special addresses:
>> +.B VMADDR_CID_ANY
>> +(-1U)
>> +means any address for binding;
>> +.B VMADDR_CID_HYPERVISOR
>> +(0) is reserved for services built into the hypervisor;
>> +.B VMADDR_CID_RESERVED
>> +(1) must not be used;
>> +.B VMADDR_CID_HOST
>> +(2)
>> +is the well-known address of the host.
>> +.PP
>> +The special constant
>> +.B VMADDR_PORT_ANY
>> +(-1U)
>> +means any port number for binding.
>> +.SS Live migration
>> +Sockets are affected by live migration of virtual machines.  Connected
>> +.B SOCK_STREAM
>> +sockets become disconnected when the virtual machine migrates to a new host.
>> +Applications must reconnect when this happens.
>> +.PP
>> +The local CID may change across live migration if the old CID is not available
>> +on the new host.  Bound sockets are automatically updated to the new CID.
>> +.SS Ioctls
>> +.TP
>> +.B IOCTL_VM_SOCKETS_GET_LOCAL_CID
>> +Get the CID of the local machine.  The argument is a pointer to an unsigned int.
>> +.IP
>> +.in +4n
>> +.EX
>> +.IB error " = ioctl(" socket ", " IOCTL_VM_SOCKETS_GET_LOCAL_CID ", " &cid ");"
>> +.EE
>> +.in
>> +.IP
>> +Consider using
>> +.B VMADDR_CID_ANY
>> +when binding instead of getting the local CID with
>> +.BR IOCTL_VM_SOCKETS_GET_LOCAL_CID .
>> +.SH ERRORS
>> +.TP
>> +.B EACCES
>> +Unable to bind to a privileged port without the
>> +.B CAP_NET_BIND_SERVICE
>> +capability.
>> +.TP
>> +.B EINVAL
>> +Invalid parameters.  This includes:
>> +attempting to bind a socket that is already bound, providing an invalid struct
>> +.BR sockaddr_vm ,
>> +and other input validation errors.
>> +.TP
>> +.B EOPNOTSUPP
>> +Operation not supported.  This includes:
>> +the
>> +.B MSG_OOB
>> +flag that is not implemented for
>> +.BR sendmsg (2)
>> +and
>> +.B MSG_PEEK
>> +for
>> +.BR recvmsg (2).
>> +.TP
>> +.B EADDRINUSE
>> +Unable to bind to a port that is already in use.
>> +.TP
>> +.B EADDRNOTAVAIL
>> +Unable to find a free port for binding or unable to bind to a non-local CID.
>> +.TP
>> +.B ENOTCONN
>> +Unable to perform operation on an unconnected socket.
>> +.TP
>> +.B ENOPROTOOPT
>> +Invalid socket option in
>> +.BR setsockopt (2)
>> +or
>> +.BR getsockopt (2).
>> +.TP
>> +.B EPROTONOSUPPORT
>> +Invalid socket protocol number.  Protocol should always be 0.
>> +.TP
>> +.B ESOCKTNOSUPPORT
>> +Unsupported socket type in
>> +.BR socket (2).
>> +Only
>> +.B SOCK_STREAM
>> +and
>> +.B SOCK_DGRAM
>> +are valid.
>> +.SH VERSIONS
>> +Support for VMware (VMCI) has been available since Linux 3.9.  KVM (virtio) is
>> +supported since Linux 4.8.  Hyper-V is supported since 4.14.
>> +.SH SEE ALSO
>> +.BR socket (2),
>> +.BR bind (2),
>> +.BR connect (2),
>> +.BR listen (2),
>> +.BR send (2),
>> +.BR recv (2),
>> +.BR capabilities (7)
>> -- 
>> 2.14.3
>>
> 
> Looks great to me. Thanks for doing this. I don’t have anything to add.
> 
> Reviewed-by: Jorgen Hansen <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>

Thanks, Jorgen!

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
