namespace H_Mandiola.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DataContext : DbContext
    {
        public DataContext()
            : base("name=Mandiola")
        {
        }

        public virtual DbSet<Actividad> Actividad { get; set; }
        public virtual DbSet<Articulo> Articulo { get; set; }
        public virtual DbSet<Bitacora> Bitacora { get; set; }
        public virtual DbSet<BookingID> BookingID { get; set; }
        public virtual DbSet<Consecutivos> Consecutivo { get; set; }
        public virtual DbSet<Emisor> Emisor { get; set; }
        public virtual DbSet<Error> Error { get; set; }
        public virtual DbSet<Est_Hab> Est_Hab { get; set; }
        public virtual DbSet<Estado> Estado { get; set; }
        public virtual DbSet<Habitacion> Habitacion { get; set; }
        public virtual DbSet<Historial_Actividad> Historial_Actividad { get; set; }
        public virtual DbSet<Precio> Precio { get; set; }
        public virtual DbSet<Reserva> Reserva { get; set; }
        public virtual DbSet<Rol> Rol { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Tarjeta> Tarjeta { get; set; }
        public virtual DbSet<Tipo_Articulo> Tipo_Articulo { get; set; }
        public virtual DbSet<Tipo_Habitacion> Tipo_Habitacion { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Actividad>()
                .Property(e => e.Codigo)
                .IsUnicode(false);

            modelBuilder.Entity<Actividad>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<Actividad>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Actividad>()
                .Property(e => e.Dia)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Actividad>()
                .HasMany(e => e.Historial_Actividad)
                .WithRequired(e => e.Actividad1)
                .HasForeignKey(e => e.Actividad)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Articulo>()
                .Property(e => e.Codigo)
                .IsUnicode(false);

            modelBuilder.Entity<Articulo>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<Articulo>()
                .Property(e => e.Reserva)
                .IsUnicode(false);

            modelBuilder.Entity<Bitacora>()
                .Property(e => e.Codigo)
                .IsUnicode(false);

            modelBuilder.Entity<Bitacora>()
                .Property(e => e.Tipo)
                .IsUnicode(false);

            modelBuilder.Entity<Bitacora>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<BookingID>()
                .Property(e => e.Habitacion)
                .IsUnicode(false);

            modelBuilder.Entity<BookingID>()
                .Property(e => e.Reserva)
                .IsUnicode(false);

            modelBuilder.Entity<Consecutivos>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Consecutivos>()
                .Property(e => e.Prefijo)
                .IsUnicode(false);

            modelBuilder.Entity<Emisor>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Emisor>()
                .HasMany(e => e.Tarjeta)
                .WithRequired(e => e.Emisor1)
                .HasForeignKey(e => e.Emisor)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Error>()
                .Property(e => e.Mensaje)
                .IsUnicode(false);

            modelBuilder.Entity<Est_Hab>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Est_Hab>()
                .HasMany(e => e.Habitacion)
                .WithRequired(e => e.Est_Hab1)
                .HasForeignKey(e => e.Est_Hab)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Estado>()
                .Property(e => e.Tipo)
                .IsUnicode(false);

            modelBuilder.Entity<Estado>()
                .HasMany(e => e.Usuario)
                .WithRequired(e => e.Estado1)
                .HasForeignKey(e => e.Estado)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Habitacion>()
                .Property(e => e.Codigo)
                .IsUnicode(false);

            modelBuilder.Entity<Habitacion>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Habitacion>()
                .Property(e => e.Precio)
                .IsUnicode(false);

            modelBuilder.Entity<Habitacion>()
                .HasMany(e => e.BookingID)
                .WithRequired(e => e.Habitacion1)
                .HasForeignKey(e => e.Habitacion)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Historial_Actividad>()
                .Property(e => e.Usuario)
                .IsUnicode(false);

            modelBuilder.Entity<Historial_Actividad>()
                .Property(e => e.Actividad)
                .IsUnicode(false);

            modelBuilder.Entity<Precio>()
                .Property(e => e.Codigo)
                .IsUnicode(false);

            modelBuilder.Entity<Precio>()
                .HasMany(e => e.Habitacion)
                .WithRequired(e => e.Precio1)
                .HasForeignKey(e => e.Precio)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Reserva>()
                .Property(e => e.Codigo)
                .IsUnicode(false);

            modelBuilder.Entity<Reserva>()
                .Property(e => e.Codigo_Promocional)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Reserva>()
                .Property(e => e.Mascota)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Reserva>()
                .Property(e => e.Metodo_Pago)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Reserva>()
                .Property(e => e.Usuario)
                .IsUnicode(false);

            modelBuilder.Entity<Reserva>()
                .HasMany(e => e.Articulo)
                .WithRequired(e => e.Reserva1)
                .HasForeignKey(e => e.Reserva)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Reserva>()
                .HasMany(e => e.BookingID)
                .WithRequired(e => e.Reserva1)
                .HasForeignKey(e => e.Reserva)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Rol>()
                .Property(e => e.Tipo)
                .IsUnicode(false);

            modelBuilder.Entity<Rol>()
                .HasMany(e => e.Usuario)
                .WithRequired(e => e.Rol1)
                .HasForeignKey(e => e.Rol)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tarjeta>()
                .Property(e => e.Usuario)
                .IsUnicode(false);

            modelBuilder.Entity<Tipo_Articulo>()
                .Property(e => e.Tipo)
                .IsUnicode(false);

            modelBuilder.Entity<Tipo_Articulo>()
                .HasMany(e => e.Articulo)
                .WithRequired(e => e.Tipo_Articulo1)
                .HasForeignKey(e => e.Tipo_Articulo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tipo_Habitacion>()
                .Property(e => e.Tipo)
                .IsUnicode(false);

            modelBuilder.Entity<Tipo_Habitacion>()
                .HasMany(e => e.Precio)
                .WithRequired(e => e.Tipo_Habitacion1)
                .HasForeignKey(e => e.Tipo_Habitacion)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Codigo)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Apellido1)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Apellido2)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Usuario1)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Clave)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Pregunta)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Respuesta)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Historial_Actividad)
                .WithRequired(e => e.Usuario1)
                .HasForeignKey(e => e.Usuario)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Reserva)
                .WithRequired(e => e.Usuario1)
                .HasForeignKey(e => e.Usuario)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Tarjeta)
                .WithRequired(e => e.Usuario1)
                .HasForeignKey(e => e.Usuario)
                .WillCascadeOnDelete(false);
        }
    }
}
