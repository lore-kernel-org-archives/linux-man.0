From: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] hugetlbfs: Allow the creation of files suitable for
 MAP_PRIVATE on the vfs internal mount V3
Date: Fri, 14 Aug 2009 12:19:00 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.0908141218230.12472@chino.kir.corp.google.com>
References: <cover.1250258125.git.ebmunson@us.ibm.com> <d2e4f6625a147c1ef6cb26de66849875f57a8155.1250258125.git.ebmunson@us.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d2e4f6625a147c1ef6cb26de66849875f57a8155.1250258125.git.ebmunson-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric B Munson <ebmunson-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 14 Aug 2009, Eric B Munson wrote:

> There are two means of creating mappings backed by huge pages:
> 
>         1. mmap() a file created on hugetlbfs
>         2. Use shm which creates a file on an internal mount which essentially
>            maps it MAP_SHARED
> 
> The internal mount is only used for shared mappings but there is very
> little that stops it being used for private mappings. This patch extends
> hugetlbfs_file_setup() to deal with the creation of files that will be
> mapped MAP_PRIVATE on the internal hugetlbfs mount. This extended API is
> used in a subsequent patch to implement the MAP_HUGETLB mmap() flag.
> 
> Signed-off-by: Eric Munson <ebmunson-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V2:
>  Rebase to newest linux-2.6 tree
>  Use base 10 value for HUGETLB_SHMFS_INODE instead of hex
> 
> Changes from V1:
>  Rebase to newest linux-2.6 tree
> 
>  fs/hugetlbfs/inode.c    |   22 ++++++++++++++++++----
>  include/linux/hugetlb.h |   10 +++++++++-
>  ipc/shm.c               |    3 ++-
>  3 files changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 941c842..361f536 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -506,6 +506,13 @@ static struct inode *hugetlbfs_get_inode(struct super_block *sb, uid_t uid,
>  		inode->i_atime = inode->i_mtime = inode->i_ctime = CURRENT_TIME;
>  		INIT_LIST_HEAD(&inode->i_mapping->private_list);
>  		info = HUGETLBFS_I(inode);
> +		/*
> +		 * The policy is initialized here even if we are creating a
> +		 * private inode because initialization simply creates an
> +		 * an empty rb tree and calls spin_lock_init(), later when we
> +		 * call mpol_free_shared_policy() it will just return because
> +		 * the rb tree will still be empty.
> +		 */
>  		mpol_shared_policy_init(&info->policy, NULL);
>  		switch (mode & S_IFMT) {
>  		default:
> @@ -930,12 +937,19 @@ static struct file_system_type hugetlbfs_fs_type = {
>  
>  static struct vfsmount *hugetlbfs_vfsmount;
>  
> -static int can_do_hugetlb_shm(void)
> +static int can_do_hugetlb_shm(int creat_flags)
>  {
> -	return capable(CAP_IPC_LOCK) || in_group_p(sysctl_hugetlb_shm_group);
> +	if (!(creat_flags & HUGETLB_SHMFS_INODE))
> +		return 0;

That should be

	if (creat_flags != HUGETLB_SHMFS_INODE)
		return 0;
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
