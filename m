From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 11 Nov 2014 13:42:23 +0100
Message-ID: <5462042F.7070608@gmail.com>
References: <1415659009-5921-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415659009-5921-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

On 11/10/2014 11:36 PM, Heinrich Schuchardt wrote:
> The ioctl(2) system call may be used to retrieve information about
> the fat file system and to set file attributes.
> 
> This new manpage describes the details.

Great work! I have a few comments below.

Let's attempt to widen the review circle. On the next submission,
could you also CC linux-fsdevelo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org and 
linux-kernel-u79uwXL29TaiAVqoAR/hOA@public.gmane.org 

Please also CC the FAT maintainer: 
OGAWA Hirofumi <hirofumi-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org>

> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/ioctl-fat.2 | 437 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 437 insertions(+)
>  create mode 100644 man2/ioctl-fat.2
> 
> diff --git a/man2/ioctl-fat.2 b/man2/ioctl-fat.2
> new file mode 100644
> index 0000000..ceb3c5f
> --- /dev/null
> +++ b/man2/ioctl-fat.2

I wonder if it might be better to call this page "ioctl_fat.2"
just for consistency with ioctl_list.2. What do you think?

> @@ -0,0 +1,437 @@
> +.\" Copyright (C) 2014, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(VERBATIM)
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\" %%%LICENSE_END
> +.TH IOCTl-FAT 2 2014-11-10 "Linux" "Linux Programmer's Manual"
> +.SH "NAME"
> +ioctl-fat \- manipulating the fat file system
> +.SH SYNOPSIS
> +.B #include <linux/msdos_fs.h>
> +.br
> +.B #include <sys/ioctl.h>
> +.sp
> +.BI "int ioctl(int " fd ", FAT_IOCTL_GET_ATTRIBUTES, uint32_t * " attr);
> +.br
> +.BI "int ioctl(int " fd ", FAT_IOCTL_SET_ATTRIBUTES, uint32_t * " attr);
> +.br
> +.BI "int ioctl(int " fd ", FAT_IOCTL_GET_VOLUME_ID, uint32_t * " id);
> +.br
> +.BI "int ioctl(int " fd ", VFAT_IOCTL_READDIR_BOTH, struct __fat_dirent[2] " entry);
> +.br
> +.BI "int ioctl(int " fd ", VFAT_IOCTL_READDIR_SHORT, struct __fat_dirent[2] " entry);

Please bracket the SYNOPSIS with 
.nf
.fi

Then you can remove the .br tags. Also, could you manually indent
the lines that wrap (as is done in say mmap.2).

> +.SH DESCRIPTION
> +The
> +.BR ioctl (2)
> +function can be used to read and write metadata of the fat file systems that

I think all instances of "fat" in the text should be "FAT" right?

change all instances of "file system" to "filesystem"

> +are not accessible using other system calls.
> +.SS Reading and setting file attributes
> +Files and directories in the fat filesystem possess an attribute bit mask that
> +can be read with
> +.B FAT_IOCTL_GET_ATTRIBUTES
> +and written with
> +.BR FAT_IOCTL_SET_ATTRIBUTES .
> +.PP
> +The
> +.I fd
> +argument contains a file descriptor for the file or directory.
> +It is sufficient to create the file descriptor by calling
> +.BR open (2)
> +with the 
> +.B O_RDONLY
> +flag.
> +.PP
> +The
> +.I attr
> +argument contains a pointer to the bitmask.

Change all instances to "bit mask"

> +The bits of the bitmask are

s/$/:/

> +.TP
> +.B ATTR_RO
> +This bit specifies that the file or directory is read only.

s/read only/read-only/

And other instances below.

> +.TP
> +.B ATTR_HIDDEN
> +This bit specifies that the file or directory is hidden.
> +.TP
> +.B ATTR_SYS
> +This bit specifies that the file is a system file.
> +.TP
> +.B ATTR_VOLUME
> +This bit specifies that the file is a volume label.
> +This attribute is read only.
> +.TP
> +.B ATTR_DIR
> +This bit specifies that this is a directory.
> +This attribute is read only.
> +.TP
> +.B ATTR_ARCH
> +This bit indicates that this file or directory should be archived.
> +It is set when a file is created or modified.
> +It is reset by an archiving system.
> +.PP
> +Zero value

s/Zero/The zero/

> +.B ATTR_NONE
> +can be used to indicate that no attribute bit is set.
> +.SS Reading the volume label
> +Fat file systems are identified by a volume label.
> +The volume label can be read with
> +.BR FAT_IOCTL_GET_VOLUME_ID .
> +.PP
> +The
> +.I fd
> +argument can be an file descriptor for any file or directory of they

s/an file/a file/
s/they/the/

> +file system.
> +It is sufficient to create the file descriptor by calling
> +.BR open (2)
> +with the
> +.B O_RDONLY
> +flag.
> +.PP
> +The
> +.I id
> +argument is a pointer to the field that will be filled with the volume id.

s/id/ID/ 
And in other instances below, including the code comments and the
strings output by the example programs.

> +Typically the volume label is displayed to the user a a group of two

s/Typically/Typically,/
s/a a/as a/

> +16 bit fields.

s/16 bit/16-bt/

> +.PP
> +.in +4n
> +.nf
> +printf("Volume id %4x-%4x\n", id >> 16, id & 0xFFFF);
> +.fi
> +.in
> +.SS Reading short file names of a directory
> +A file or directory on a fat file system always has a short filename
> +consisting of up to 8 capital letters, optionally followed by a period
> +and up to 3 capital letters for the file extension.
> +If the actual filename does not fit into this scheme, it is stored
> +as a long filename of up to 255 UTF-16 characters.
> +.PP
> +The short filenames in a directory can be read with
> +.BR VFAT_IOCTL_READDIR_SHORT .
> +.B VFAT_IOCTL_READDIR_BOTH
> +reads both the short and the long filenames.
> +.PP
> +The
> +.I fd
> +argument has to be a file descriptor for a directory.

s/has to/must/

> +It is sufficient to create the file descriptor by calling
> +.BR open (2)
> +with the 
> +.B O_RDONLY
> +flag.
> +The file descriptor can only be used once to iterate over the directory

s/only be used once/be only used once/

> +entries by calling
> +.BR ioctl (2)
> +repeatedly.
> +.PP
> +The
> +.I entry
> +argument is an array of length two of the following structure.

s/an array of length two of the following structure/
  a two-element containing the following structures/

s/\./:/

And add a blank line here.

> +.in +4n
> +.nf
> +struct __fat_dirent {
> +    long            d_ino;
> +    __kernel_off_t  d_off;
> +    uint32_t short  d_reclen;
> +    char            d_name[256];
> +};
> +.fi
> +.in
> +.PP
> +The first entry in the array is for the short filename.
> +The second entry is for the long filename.
> +.PP
> +Field
> +.I d_reclen
> +specifies the length of the filename in field
> +.IR d_name .
> +A length of 0 for the short filename signals that the end of the directory
> +has been reached.
> +.SH RETURN VALUE
> +On error, -1 is returned, and errno is set to indicate the error.
> +.SH ERRORS

The formatting of the errors section is wrong. You want a .TP
list. See some other *.2 pages for examples.

> +.B ENOTDIR
> +This error is returned by
> +.B VFAT_IOCTL_READDIR_SHORT
> +and
> +.B VFAT_IOCTL_READDIR_SHORT
> +if the file descriptor does not point to a directory.
> +.PP
> +.B ENOTTY
> +This error signals that the file descriptor is not for a fat filesystem.
> +.PP
> +For further error values see
> +.BR ioctl (2).
> +.SH EXAMPLE
> +.SS Toggling archive flag

s/archive/the archive/

> +The following program demonstrates the usage of the ioctl API to manipulate
> +file attributes.
> +It reads and displays the archive attribute of a file.
> +After inverting the value of the attribute it reads and displays it again.

s/attribute/attribute,/

> +.PP
> +The following was recorded when calling the program for file

s/calling/applying/
s/for file/to the file/

> +.IR /mnt/user/foo .
> +.SS Example output

Thanks for these example programs! But, I think the output 
could be a little less verbose. In this and the next program,
I think you could drop the following message with no loss of
understanding for the reader:

* Reading FAR attributes
* Closing...

Also, I'd tend to drop the "." at the end of each output
line, but that's mostly a personal taste thing.
(But, I note that your final example does have 
instances of "." on the output lines.)

> +.in +4n
> +.nf
> +# ./toggle_archive_flag /mnt/user/foo
> +Opening /mnt/user/foo.                                                                                                                                                                                   
> +Reading FAT attributes.                                                                                                                                                                                  
> +Archive flag is set.                                                                                                                                                                                     
> +Toggling archive attribute.                                                                                                                                                                              
> +Reading FAT attributes.                                                                                                                                                                                  
> +Archive flag is not set.                                                                                                                                                                                 
> +Closing /mnt/user/foo.
> +.fi
> +.in
> +.SS Program source
> +.in +4n
> +.nf
> +#include <fcntl.h>
> +#include <linux/msdos_fs.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/ioctl.h>

You need to include unistd.h for close(2).
(Best to ensure that all code passes "cc -Wall -Wextra)

Also in the other examples below.

> +
> +/*
> + * Read file attributes of a file on a FAT file system.
> + * Output the state of the archive flag.
> + */
> +static uint32_t
> +readattr(int fd)
> +{
> +    uint32_t attr;
> +    int ret;
> +
> +    printf("Reading FAT attributes.\\n");
> +    ret = ioctl(fd, FAT_IOCTL_GET_ATTRIBUTES, &attr);
> +    if (ret == \-1) {
> +        perror("ioctl");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    if (attr & ATTR_ARCH)
> +        printf("Archive flag is set.\\n");
> +    else
> +        printf("Archive flag is not set.\\n");
> +
> +    return attr;
> +}
> +
> +int
> +main(int argc, char *argv[])
> +{
> +    uint32_t attr;
> +    int fd;
> +    int ret;
> +
> +    if (argc != 2) {
> +        printf("Usage %s FILENAME\\n", argv[0]);

s/Usage/Usage:/
(and in the other example programs)

> +        return EXIT_FAILURE;
> +    }
> +
> +    printf("Opening %s.\\n", argv[1]);
> +    fd = open(argv[1], O_RDONLY);
> +    if (fd == \-1) {
> +        perror("open");
> +        return EXIT_FAILURE;

For consistency with the rest of the code base, I prefer the form


exit(EXIT_...);

Could you all the examples change please.

> +    }
> +
> +    /*
> +     * Read and display the FAT file attributes.
> +     */
> +    attr = readattr(fd);
> +
> +    /*
> +     * Invert archive attribute.
> +     */
> +    printf("Toggling archive attribute.\\n");
> +    attr ^= ATTR_ARCH;
> +
> +    /*
> +     * Write the changed FAT file attributes.
> +     */
> +    ret = ioctl(fd, FAT_IOCTL_SET_ATTRIBUTES, &attr);
> +    if (ret == \-1) {
> +        perror("ioctl");
> +        return EXIT_FAILURE;
> +    }
> +
> +    /*
> +     * Read and display the FAT file attributes.
> +     */
> +    readattr(fd);
> +
> +    printf("Closing %s.\\n", argv[1]);
> +    close(fd);
> +
> +    return EXIT_SUCCESS;
> +}
> +.fi
> +.in
> +.SS Reading the volume label
> +The following program demonstrates the usage of the ioctl API to
> +display the volume label of a fat file system.
> +.PP
> +The following output was recored when calling the program for

s/recored/recorded/

> +directory
> +.IR /mnt/user

s/$/ ./

> +.SS Example output
> +.in +4n
> +.nf
> +$ ./display_volume_id /mnt/user
> +Opening /mnt/user
> +Volume id 6443-6241
> +Closing /mnt/user
> +.fi
> +.in
> +.SS Program source
> +.in +4n
> +.nf
> +#include <fcntl.h>
> +#include <linux/msdos_fs.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/ioctl.h>
> +
> +int
> +main(int argc, char *argv[])
> +{
> +    uint32_t id;
> +    int fd;
> +    int ret;
> +
> +    if (argc != 2) {
> +        printf("Usage %s FILENAME\\n", argv[0]);
> +        return EXIT_FAILURE;
> +    }
> +
> +    printf("Opening %s\\n", argv[1]);
> +    fd = open(argv[1], O_RDONLY);
> +    if (fd == \-1) {
> +        perror("open");
> +        return EXIT_FAILURE;
> +    }
> +
> +    /*
> +     * Read volume id.
> +     */
> +    ret = ioctl(fd, FAT_IOCTL_GET_VOLUME_ID, &id);
> +    if (ret == \-1) {
> +        perror("ioctl");
> +        return EXIT_FAILURE;
> +    }
> +
> +    /*
> +     * Format the output as two groups of 16 bits each.
> +     */
> +    printf("Volume id %4x\-%4x\\n", id >> 16, id & 0xFFFF);
> +
> +    printf("Closing %s\\n", argv[1]);
> +    close(fd);
> +
> +    return EXIT_SUCCESS;
> +}
> +.fi
> +.in
> +.SS Listing a directory
> +The following program demonstrates the usage of the ioctl API to
> +list a directory.
> +.PP
> +The following was recorded when calling the program for directory

s/calling/applying/
s/for directory/to the directory/


> +.IR /mnt/user .
> +.SS Example output
> +.in +4n
> +.nf
> +$ ./fat_dir /mnt/user
> +\[char46] -> ''
> +\[char46]. -> ''
> +ALONGF~1.TXT -> 'a long filename.txt'
> +UPPER.TXT -> ''
> +LOWER.TXT -> 'lower.txt'
> +.fi
> +.in
> +.SS Program source
> +.in +4n
> +.nf
> +#include <fcntl.h>
> +#include <linux/msdos_fs.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/ioctl.h>
> +
> +int
> +main(int argc, char *argv[])
> +{
> +    struct __fat_dirent entry[2];
> +    int fd;
> +    int ret;
> +
> +    if (argc != 2) {
> +        printf("Usage %s DIRECTORY\\\\n", argv[0]);
> +        return EXIT_FAILURE;
> +    }
> +
> +    /*
> +     * Open file descriptor for the directory.
> +     */
> +    fd = open(argv[1], O_RDONLY | O_DIRECTORY);
> +    if (fd == \-1) {
> +        perror("open");
> +        return EXIT_FAILURE;
> +    }
> +
> +    for (;;) {
> +
> +        /*
> +         * read next directory entry
> +         */
The above comment is formatted differntly from the others.


> +        ret = ioctl( fd, VFAT_IOCTL_READDIR_BOTH, entry);
> +
> +        /*
> +         * If an error occurs the return value is \-1.

s/occurs/occurs,/

> +         * The end of the directory list is reached when
> +         * the d_reclen is zero.

I'd make that last:

Id d_reclen is zero, then the end of the directory list has 
been reached.

> +         */
> +        if (ret == \-1 || entry[0].d_reclen == 0)
> +            break;
> +
> +        /*
> +         * Write both the short name and the long name.
> +         */
> +        printf("%s \-> '%s'\\n", entry[0].d_name, entry[1].d_name);
> +    }
> +    if (ret == \-1) {
> +        perror("VFAT_IOCTL_READDIR_BOTH");
> +        return EXIT_FAILURE;
> +    }
> +
> +    /*
> +     * Close the file descriptor.
> +     */
> +    close(fd);
> +
> +    return EXIT_SUCCESS;
> +}
> +.fi
> +.in
> +.SH SEE ALSO
> +.BR ioctl (2)

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
