From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fts man page
Date: Tue, 19 Dec 2017 07:28:50 +0100
Message-ID: <089ce5c8-29cc-ab96-1cd4-bb56675f5a4d@gmail.com>
References: <0cbe4f3a-c2d6-b45d-26eb-549d46a59667@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0cbe4f3a-c2d6-b45d-26eb-549d46a59667-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pradeep Kumar <pradeepsixer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Pradeep,

On 02/12/2017 08:46 AM, Pradeep Kumar wrote:
> The man page for fts library call states both the following:
> 
>      short          fts_pathlen;  /* strlen(fts_path) */
> 
>      fts_pathlen The length of the string referenced by fts_path
> 
> However, for the structures returned from fts_children() function, 
> fts_pathlen is strlen(fts_path) + strlen(fts_name), which contradicts 
> the man page statement. So I believe that there is either a bug in the 
> man page or the fts_children() library call.
> 
> The following program can be used for verification:
>> #include <fts.h>
> #include <pwd.h>
> #include <stdio.h>
> #include <string.h>
> 
> int main() {
> 	struct passwd *pwd_entry = getpwuid(getuid());
> 	char *paths[] = {pwd_entry->pw_dir, NULL};
> 	FTS* fts = fts_open(paths, FTS_LOGICAL, NULL);
> 	FTSENT* ftsent = fts_read(fts);
> 	FTSENT* child = fts_children(fts, 0);
> 	while (child != NULL) {
> 		printf("\n %s %s %d %lu", child->fts_path, child->fts_name,
> 				child->fts_pathlen, strlen(child->fts_path));
> 		child = child->fts_link;
> 	}
> 	return 0;
> }


Thanks, and sorry for the long delay in following up. I tested your
program also on OpenBSD. I agree with your observation. I applied the 
patch below.

Cheers,

Michael

diff --git a/man3/fts.3 b/man3/fts.3
index f9e1ba51d..d25833cb8 100644
--- a/man3/fts.3
+++ b/man3/fts.3
@@ -118,7 +118,8 @@ typedef struct _ftsent {
     unsigned short  fts_info;     /* flags for FTSENT structure */
     char           *fts_accpath;  /* access path */
     char           *fts_path;     /* root path */
-    short           fts_pathlen;  /* strlen(fts_path) */
+    short           fts_pathlen;  /* strlen(fts_path) +
+                                     strlen(fts_name) */
     char           *fts_name;     /* filename */
     short           fts_namelen;  /* strlen(fts_name) */
     short           fts_level;    /* depth (\-1 to N) */
@@ -249,8 +250,10 @@ This path contains the path specified to
 as a prefix.
 .TP
 .IR fts_pathlen
-The length of the string referenced by
-.IR fts_path .
+The sum of the lengths of the strings referenced by
+.IR fts_path
+and
+.IR fts_name .
 .TP
 .IR fts_name
 The name of the file.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
